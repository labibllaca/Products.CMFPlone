## Controller Python Script "folder_copy"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind state=state
##bind subpath=traverse_subpath
##parameters=
##title=Copy object from a folder to the clipboard
##
REQUEST=context.REQUEST
if REQUEST.has_key('ids'):
    context.manage_copyObjects(REQUEST['ids'], REQUEST, REQUEST.RESPONSE)
    return context.portal_navigation.getNext( context
                , script.getId()
                , 'success'
                , portal_status_message='Item(s) copied.')
    return state.set(portal_status_message='Item(s) copied.')

return state.set(status='failure', portal_status_message='Please select one or more items to copy.')
