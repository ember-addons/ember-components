#(c) 2014 Indexia, Inc.

#Tab Component
`import TabsComponent               from './tabs/tabs';`
`import TabsStyle                   from './tabs/tabs-css';`
`import TabListComponent            from './tabs/tab-list';`
`import TabComponent                from './tabs/tab';`
`import TabPanelComponent           from './tabs/tab-panel';`

#Wysiwyg Component
`import WysiwygComponent            from './wysiwyg/wysiwyg';`
`import WysiwygToolbarComponent     from './wysiwyg/toolbar';`
`import WysiwygActionGroupComponent from './wysiwyg/action-group';`
`import WysiwygActionComponent      from './wysiwyg/action';`
`import WysiwygActionTmpl           from './wysiwyg/actiontmpl';`
`import WysiwygEditorComponent      from './wysiwyg/editor';`
`import WysiwygActionLinkComponent  from './wysiwyg/action-link';`
`import WysiwygActionLinkTmpl       from './wysiwyg/action-link-tmpl'`

#Accordion Component
`import AccordionComponent          from './accordion/accordion';`
`import AccordionItemComponent      from './accordion/accordion-item';`
`import AccordionItemTmpl           from './accordion/accordion-item-tmpl';`

#Tree Component
`import TreeNode                    from './tree/node'`
`import TreeNodeComponent           from './tree/tree-node'`
`import TreeNodeTmpl                from './tree/tree-node-tmpl'`
`import TreeBranchComponent         from './tree/tree-branch'`
`import TreeBranchTmpl              from './tree/tree-branch-tmpl'`
`import TreeBranchStyle             from './tree/tree-branch-css'`

#List Component
`import ListComponent               from './list/list'`
`import ListItemComponent           from './list/list-item'`

#Modal Component
`import ModalComponent              from './modal/modal'`
`import ModalFormComponent          from './modal/modal-form'`
`import ModalTitleComponent         from './modal/modal-title'`
`import ModalBodyComponent          from './modal/modal-body'`
`import ModalFooterComponent        from './modal/modal-footer'`
`import ModalTogglerComponent       from './modal/modal-toggler'`
`import ModalTmpl                   from './modal/modal-tmpl'`
`import ModalConfirmComponent       from './modal/modal-confirm'`
`import ModalConfirmTmpl            from './modal/modal-confirm-tmpl'`

#General
`import {Application, Namespace}    from 'ember';`

Application.initializer
    name: 'em-components'
    initialize: (c) ->
        # Configuration
        Em.EmberComponents = Namespace.create
            VERSION: '0.0.1'
        Em.Config = Config = Em.Eu.Config.create()
        Config.addConfig('default', 
            tabs:
                tabsTag: ['div']
                tabTag: ['li']
                tabListTag: ['ul']
            tree:
                branchClasses: ['em-tree-branch', 'fa-ul']
                nodeClasses: ['em-tree-node']
                nodeOpenClasses: []
                nodeCloseClasses: []
                nodeOpenIconClasses: ['fa-li', 'fa', 'fa-minus-square-o']
                nodeCloseIconClasses: ['fa-li', 'fa', 'fa-plus-square-o']
                nodeLeafClasses: ['leaf']
                nodeLeafIconClasses: ['fa-li', 'fa','fa-square-o']
                nodeLoadingIconClasses: ['fa-li', 'fa', 'fa-spinner', 'fa-spin']
                nodeSelectedClasses: ['em-tree-node-active']

        )
        Config.addConfig('classic',
            tabs:
                tabsClasses: ['em-tabs']
                tabClasses: ['em-tab']
                tabListClasses: ['em-tab-list']
                tabPanelClasses: ['em-tab-panel']
        )
        Config.addConfig('bs',
            tabs:
                tabListClasses: ['nav', 'nav-tabs']
                tabSelectedClasses: ['active']
            wysiwyg:
                classes: ['well']
                toolbarClasses: ['btn-toolbar']
                actionGroupClasses: ['btn-group']
                actionClasses: ['btn btn-default']
                actionActiveClasses: ['active']
            accordion:
                classes: ['panel-group']
                itemClasses: ['panel', 'panel-default']
                itemSelectedClasses: ['active']
                panelHeaderClasses: ['panel-heading']
                panelTitleClasses: ['panel-title']
                panelTogglerClasses: ['accordion-toggle']
                panelBodyContainerClasses: ['panel-collapse','collapse']
                panelBodyClasses: ['panel-body']
            modal:
                classes: ['modal', 'fade']
                bodyClasses: ['modal-body']
                titleClasses: ['modal-header']
                footerClasses: ['modal-footer']
        )
        Config.addConfig('foundation',
            tabs:
                tabListClasses: ['tabs']
                tabSelectedClasses: ['active']
                tabClasses: ['tab-title']
                tabPanelClasses: ['content']
        )
        Em.EmberComponents.Config = Em.Config = Config

        # Tab Component
        c.register 'component:em-tabs', TabsComponent
        c.register 'template:components/em-tabs-css', TabsStyle
        c.register 'component:em-tab-list', TabListComponent
        c.register 'component:em-tab', TabComponent
        c.register 'component:em-tab-panel', TabPanelComponent

        # Wysiwyg
        c.register 'component:em-wysiwyg', WysiwygComponent
        c.register 'component:em-wysiwyg-toolbar', WysiwygToolbarComponent
        c.register 'component:em-wysiwyg-action-group', WysiwygActionGroupComponent
        c.register 'component:em-wysiwyg-action', WysiwygActionComponent
        c.register 'template:em-wysiwyg-action', WysiwygActionTmpl
        c.register 'component:em-wysiwyg-editor', WysiwygEditorComponent
        c.register 'component:em-wysiwyg-action-link', WysiwygActionLinkComponent
        c.register 'template:em-wysiwyg-action-link', WysiwygActionLinkTmpl

        #Accordion
        c.register 'component:em-accordion', AccordionComponent
        c.register 'component:em-accordion-item', AccordionItemComponent
        c.register 'template:em-accordion-item-tmpl', AccordionItemTmpl

        #Tree
        c.register 'component:em-tree-node', TreeNodeComponent
        c.register 'template:em-tree-node', TreeNodeTmpl
        c.register 'component:em-tree-branch', TreeBranchComponent
        c.register 'template:em-tree-branch', TreeBranchTmpl
        c.register 'template:components/em-tree-branch-css', TreeBranchStyle

        #List
        c.register 'component:em-list', ListComponent
        c.register 'component:em-list-item', ListItemComponent

        #Modal
        c.register 'component:em-modal', ModalComponent
        c.register 'component:em-modal-form', ModalFormComponent
        c.register 'component:em-modal-title', ModalTitleComponent
        c.register 'component:em-modal-body', ModalBodyComponent
        c.register 'component:em-modal-footer', ModalFooterComponent
        c.register 'component:em-modal-toggler', ModalTogglerComponent
        c.register 'template:em-modal', ModalTmpl
        c.register 'component:em-modal-confirm', ModalConfirmComponent
        c.register 'template:em-modal-confirm', ModalConfirmTmpl


`export {TabsComponent, TabListComponent, TabComponent, TabPanelComponent, 
        WysiwygComponent, WysiwygToolbarComponent, WysiwygActionGroupComponent, WysiwygActionComponent, WysiwygEditorComponent,
            WysiwygActionLinkComponent, WysiwygActionLinkTmpl,
        AccordionComponent, AccordionItemComponent,
        TreeNodeComponent, TreeBranchComponent, TreeNode,
        ListComponent, ListItemComponent,
        ModalComponent, ModalTitleComponent, ModalBodyComponent, ModalFooterComponent, ModalTogglerComponent, ModalConfirmComponent, 
            ModalFormComponent}`
