Synapse Quickstart
##################

Get started using Synapse Open-Source to start a `Cortex`_ and perform analysis within your area of expertise. 

Download the Quickstart ZIP file from `the github repo`_ and unzip it to your
host filesystem.

Installing Synapse
==================

To run the Docker containers included with this Quickstart, you will need to
make sure you have installed Docker Desktop.  Follow the instructions at `Get Docker`_
before trying to execute any of the following commands.

Starting a Cortex
=================

**Windows**

Double-click ``cortex.bat`` from your file explorer to initialize the Cortex and
start up a shell that you can use to execute commands.

**MacOS (Intel Chip or Apple Chip)**

Double-click ``cortex.command`` from your file explorer to initialize the Cortex and
start up a shell that you can use to execute commands.

**Linux**

Execute ``cortex.sh`` from your terminal to initialize the Cortex and start up
a shell that you can use to execute commands.

Check Your Work
---------------

To make sure your Cortex is running and all volume mappings are correct,
run the ``helloworld.storm`` example included in ``/data/storm/``::

    python -m synapse.tools.cmdr cell:///vertex/storage 'storm --file /data/storm/helloworld.storm'

If your output looks similar to this, everything is in working order::

    root@380534a376d5:/# python -m synapse.tools.cmdr cell:///vertex/storage 'storm --file /data/storm/helloworld.storm'
    Executing query at 2021/08/24 12:28:38.419
    hello world
    complete. 0 nodes in 16 ms (0/sec).
    connection closed...

Using Synapse Tools
===================

Once you have your Cortex started, you should be able to execute Synapse `Tools`_, such as ``cmdr`` or ``csvtool`` from the shell prompt. ::

    python -m synapse.tools.cmdr cell:///vertex/storage

Any files present in the ``data`` directory will be mapped into the folder
``/data/`` within the shell and running Docker container.  This will allow you
to edit Storm scripts, import csv files, and have an easy way to map files from
your host into the Docker container.

Examples from our Blog
======================

Using Csvtool to Ingest Data
----------------------------

In `using csvtool`_, we demonstrate using ``csvtool`` to import and export data from a Cortex. The examples used in the Vertex Project blog shared here have been included in the ``/data/blogs/using-csvtool`` folder mapped into the running Docker container.

::

    cd /data/blogs/using-csvtool
    python -m synapse.tools.csvtool --csv-header --cli --cortex cell:///vertex/storage ingest.storm ingest.csv

.. _the github repo: https://github.com/vertexproject/synapse-quickstart/archive/refs/heads/main.zip
.. _Get Docker: https://docs.docker.com/get-docker/
.. _Tools: https://synapse.docs.vertex.link/en/latest/synapse/userguides/index_tools.html#tools

.. _using csvtool: https://vertex.link/blogs/using-csvtool/

.. _Cortex: https://synapse.docs.vertex.link/en/latest/synapse/glossary.html#cortex
