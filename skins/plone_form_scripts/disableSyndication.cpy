## Controller Python Script "disableSyndication"
##bind container=container
##bind context=context
##bind namespace=
##bind script=script
##bind state=state
##bind subpath=traverse_subpath
##title=Disable Syndication for a resource
##parameters=

if context.portal_syndication.isSyndicationAllowed(context):
    context.portal_syndication.disableSyndication(context)
    portal_status_message="Syndication disabled"
else:
    portal_status_message="Syndication not allowed"

return state.set(portal_status_message=portal_status_message)


