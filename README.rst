===================
Askbot - Q&A forum
===================

This is Askbot project - open source Q&A system, like StackOverflow, Yahoo Answers and some others.
Askbot is based on code of CNPROG, originally created by Mike Chen 
and Sailing Cai and some code written for OSQA.

Demos and hosting are available at http://askbot.com.

How to contribute
=================

**Translators: DO NOT use git to contribute translations!!!** instead - translate at https://www.transifex.com/projects/p/askbot/.

All documentation is in the directory askbot/doc

To contribute code, please fork and make pull requests.

If you are planning to add a new feature, please bring it up for discussion at our forum
(http://askbot.org/en/questions/) and mention that are willing to develop this feature.

We will merge obvious bug fixes without questions, for more complex fixes
please add a test case that fails before and passes after applying your fix.

**Notes on using git for Askbot.** Please use topic branches only - one per feature or bugfix.
Do not add multiple features and fixes into the same branch -
those are much harder to understand and merge.

Follow https://help.github.com/articles/fork-a-repo to to learn how to use
`fetch` and `push` as well as other help on using git.

Preparing the dev environment
=============================
This fork of the askbot code base includes a [Vagrant](https://www.vagrantup.com/) definition for use in development. To setup the Vagrant instance, run the following commands
 1. from the root of the code base, run `vagrant up` (will start and setup the VM, this may take a few minutes)
 2. once this is complete, run `vagrant ssh` (this will get you inside the VM)
 3. once inside, run `sudo setup-askbot` (this will setup the initial askbot config and run any outstanding migrations, once again, this may take a few minutes)
 4. once that is complete, you can run `run-askbot` to start the server

For more information on Vagrant and the typical Vagrant workflow, see its [documentation](https://docs.vagrantup.com/v2/).

License, copyright and trademarks
=================================
Askbot software is licensed under GPL, version 3.

Copyright Askbot S.p.A and the project contributors, 2010-2013.

"Askbot" is a trademark and service mark registered in the United States, number 4323777.

