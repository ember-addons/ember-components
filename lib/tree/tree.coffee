#(c) 2014 Indexia, Inc.

`import {Component, ArrayProxy, computed, A} from 'ember'`
#TODO: Import
WithConfigMixin = Em.Eu.WithConfigMixin

###*
# A tree component
#
# @class Tree
###
Tree = Component.extend WithConfigMixin,
    tagName: 'ul'
    layoutName: 'em-tree'
    classNameBindings: ['styleClasses']
    styleClasses: (->
        @get('config.tree.classes')?.join(" ")
    ).property()

    ###
    # An array that contains the hovered actions to be triggered per node
    # i.e: 
    # actionsMeta: [
    #    {classes: ['fa fa-eye'], action: 'eye', types: ['x', 'y']}
    #    {classes: ['fa fa-edit'], action: 'edit'}
    #    {classes: ['fa fa-trash-o'], action: 'delete'}
    # ]
    ###
    'hovered-actions': undefined

    ###
    # An object that contains meta info about each node type's icons
    # i.e:
    #    {
    #    type0: {
    #        nodeOpenIconClasses: ['fa-li', 'fa', 'fa-minus-square-o']
    #        nodeCloseIconClasses: ['fa-li', 'fa', 'fa-plus-square-o']
    #    },
    #    type1: {
    #        nodeOpenIconClasses: ['fa-li', 'fa', 'fa-tag']
    #        nodeCloseIconClasses: ['fa-li', 'fa', 'fa-tags']
    #    }
    #    }
    ###
    'icons-per-type': undefined

    ###*
    # The model to render as the root node of the tree
    # this property is expected to be defined by the user
    ###
    model: undefined

    ###*
    # True if node's children should be loaded asynchronously
    # This gives the opportunity to the user to invoke an async call to the server to retrieve data for the current
    # branch being opened
    ###
    async: false

    'in-multi-selection': false

    'multi-selection': A()

    'selected-icon': 'fa fa-check'
    'unselected-icon': 'fa fa-times'

    'expand-depth': null

    'auto-expand': false

    expandByDepth: (->
        if @get('expand-depth')
            depth = parseInt @get('expand-depth')
            return if depth is 0
            expandTree @get('model'), depth
    ).observes('expand-depth')

`export default Tree`

expandTree = (node, depth) ->
    return if depth is 0
    node.set 'expanded', true

    children = node.get('children')
    if children and "function" is typeof children.then
        children.then((loadedChildren) =>
            loadedChildren.forEach((c) =>
                expandTree c, depth-1
            )
        )
    else
        return if children.get('length') is 0 or depth is 0
        for c in children
            expandTree c, depth-1