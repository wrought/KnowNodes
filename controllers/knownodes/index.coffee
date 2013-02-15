###
* This is the routing/controller for the knownodes.
* It uses /modules/knownode.js for implementing its actions.
###
knownodeModule = require('../../modules/knownode')
relationModule = require('../../modules/relation')
baseController = require('../baseController')

module.exports =
	###options:
		before:
			index: [baseController.isLoggedIn],
			destroy: [baseController.isLoggedIn]
  ###

	show: (request, response) ->
		cb = baseController.callBack response
		modKnownode = new knownodeModule request.user
		id = request.params.knownode.replace /:/g, ''
		modKnownode.getKnownodeByKnownodeId id, cb

	create: (request, response) ->
		cb = baseController.callBack response
		modKnownode = new knownodeModule request.user
		if request.body.knownodeRelation
			modKnownode.createNewKnownodeWithRelation request.body.originalPostId, request.body.knownodeRelation, request.body.knownodeForm, cb
		else
			modKnownode.createNewKnownode request.body.knownodeForm, cb

	search: (request, response) ->
		cb = baseController.callBack response

	getUserKnownodes: (request, response) ->
		cb = baseController.callBack response
		modKnownode = new knownodeModule request.user
		modKnownode.getUserKnownodes cb

	getRelatedKnownodes: (request, response) ->
		cb = baseController.callBack response
		modKnownode = new knownodeModule request.user
		id = request.params.knownode.replace /:/g, ''
		modKnownode.getRelatedKnownodesToKnowNodeId id, cb