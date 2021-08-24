Synapse Quickstart
##################

Welcome to the Synapse quickstart!

This guide will show you how to blah blah blah...

Download the quickstart ZIP file from `the github repo`_ and unzip it to your
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

Double-click ``cortex.command`` from your file explorer to initialize the ``Cortex`` and
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

Examples from our Blog
======================

Importing Data Doesn’t have to hard: Transferring Structured Data at Scale with Csvtool
---------------------------------------------------------------------------------------

In `using csvtool`_ we demonstrate using ``csvtool`` to import and export data from a ``Cortex``. The
examples used in the blog have been included in the ``/data/blogs/using-csvtool`` folder mapped into
the running docker container.

::
    cd /data/blogs/using-csvtool
    python -m synapse.tools.csvtool --csv-header --cli --cortex cell:///vertex/storage ingest.storm ingest.csv

.. _the github repo: https://github.com/vertexproject/synapse-quickstart/archive/refs/heads/main.zip

.. _using csvtool: https://vertex.link/blogs/using-csvtool/
