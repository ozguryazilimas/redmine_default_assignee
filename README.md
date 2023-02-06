# Default Assignee

Automatically assigns an issue to a user if the issue status and user is configured in plugin settings page,
either at generic Redmine Plugin Setting page or the per project setting where you enable the module for a project.

When Apply to Context Menu is selected and issue status is changed in the context menu (right click on issue list)
assigned user will be automatically set at the server side. Note the user configured needs to be assignable to
the issue selected, consistency of this settings responsibility belongs to the user that does the configuration.

This plugin is compatible with Redmine 5.x, if you want to use it with Redmine 4.x or 3.x please use related branches
redmine4 and redmine3.


## Setup

You need to run plugin migrations to update schema for plugin

```
RAILS_ENV=production bundle exec rake redmine:plugins:migrate
```

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

