# Open Austin Demo Website

This package contains the demo websites that Open Austin has
used at various events.

To access a given website you'll want to switch to that
branch.

2015-atx-hack-for-change - For ATX Hack for Change, June 2015.

2014-atx-gis-day - For ATX GIS Day, November
2014. http://atxgisday.org/2014/

2014-tx-govt-summit - For a table we provided at the Texas
Digital Government Summit, June 2014. We particiated with
City of Austin and State of Texas in this event.

2013-city-hall-expo - For the ATX Civic Tech Expo that we
conducted at Austin City Hall, May 2013.

## Workflow

### Create a new website

Each version of the website is a branch. To create a website for a new event, start with a website of an existing event and fork it to a new branch. For example, let's create _2016-example-site_ from _2015-atx-hack-for-change_.

    git checkout 2015-atx-hack-for-change
    git checkout -b 2016-example-site
    git push --set-upstream origin 2016-example-site
    
### Updating a website

When you want to update a website, be sure to checkout the proper branch. This example shows the process to update the _2016-example-site_ website.
    
    git checkout 2016-example-site
    (make changes)
    git commit -a
    git push
    
### Publishing website updates

To publish a branch, say _2016-example-site_, to the _github.io_ site, use this process.

    git checkout gh-pages
    git merge 2016-example-site
    git push

