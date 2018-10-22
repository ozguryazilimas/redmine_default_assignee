# Default Assignee

Automatically assigns an issue to a user if the issue status and user is configured in plugin settings page,
either at generic Redmine Plugin Setting page or the per project setting where you enable the module for a project.
This plugin is compatible with Redmine 3.x.

## Features

1. Default settings can be saved.
2. Plugin can be active or passive per project.
3. You can configure default assignee to save different settings for each project.


## Settings


* As a project admin user go to project settings modules tab and enable Redmine Default Assignee.
* If you prefer configuration specific to a project, go to Default Assignee tab on project settings as a project admin user. If there is no
  project specific configuration, global configuration will be used.
* Global configuration can be done by a Redmine admin user on the Administration page plugins section. Here click on configure link next to
  Redmine Default Assignee plugin and configure your preferences. Note that if there are project specific settings, they will be preferred
  over global settings.
* On settings pages (global or project) you can define users (or groups if enabled) per status that will be automatically assigned. Blank
  value means "do not do auto assignment".

