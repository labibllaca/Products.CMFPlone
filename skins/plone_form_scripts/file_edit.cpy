## Controller Python Script "file_edit"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind state=state
##bind subpath=traverse_subpath
##parameters=precondition='', file='', id='', title=None, description=None, file_data=''
##title=Edit a file
##

from StringIO import StringIO

original_id=context.getId()
filename=getattr(file,'filename', '')

if file and filename and context.isIDAutoGenerated(original_id):
#   if there is no id or an autogenerated id, use the filename as the id
#   if not id or context.isIDAutoGenerated(id):
#   if there is no id, use the filename as the id
    if not id:
        id = filename[max( string.rfind(filename, '/')
                       , string.rfind(filename, '\\')
                       , string.rfind(filename, ':') )+1:]

file.seek(0)

# if there is no id specified, keep the current one
if not id:
    id = context.getId()

if not file and file_data:
    file=StringIO(file_data)

new_context = context.portal_factory.doCreate(context, id)

new_context.plone_utils.contentEdit( new_context
                                   , id=id
                                   , description=description )
new_context.edit( precondition=precondition, file=file )

return state.set(context=new_context, portal_status_message='File changes saved.')
