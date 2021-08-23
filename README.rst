Synapse Quickstart
##################

Welcome to the Synapse quickstart!

This guide will show you how to blah blah blah...

Download the quickstart ZIP file from TODO URL and unzip it to your
host filesystem.

Starting your ``Cortex``
========================

Windows
-------
TODO install docker

Double-click ``cortex.bat`` from your file explorer to initialize the ``Cortex`` and
start up a shell that you can use to execute commands.

MacOS
-----
TODO install docker

Double-click ``cortex.sh`` from your file explorer to initialize the ``Cortex`` and
start up a shell that you can use to execute commands.

Linux
-----
TODO install docker and docker-compose

Execute ``cortex.sh`` from your terminal to initialize the ``Cortex`` and start up
a shell that you can use to execute commands.

Once your ``Cortex`` is Running
===============================

Once you have your ``Cortex`` started, you should be able to execute synapse
tools, such as ``cmdr`` or ``csvtool`` from the shell prompt.::

    python -m synapse.tools.cmdr cell:///vertex/storage

Any files present in the ``data`` directory will be mapped into the folder
``/data/`` within the shell and running docker container.  This will allow you
to edit storm scripts, import csv files, and have an easy way to map files from
your host into the docker container.

Some Examples
=============

Ingest a CSV file
-----------------

TODO topic covered in detail a BLOG URL, but here's how to use the quickstart
``Cortex`` to follow along. TODO add files to data/blogs/using-csvtool/foo.csv
