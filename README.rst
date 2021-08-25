Synapse Quickstart
##################

Get started using Synapse Open-Source to start a `Cortex`_ and perform analysis within your area of expertise. 

Installing Docker
=================

To run the Docker containers included with this Quickstart, you will need to
make sure you have installed Docker Desktop.  Follow the instructions at `Get Docker`_
before trying to execute any of the following commands.

Installing Synapse
==================

Download the Quickstart ZIP file from `the github repo`_ and unzip it to your
host filesystem.

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

Assuming the command executed with no errors, you should have a cmdr CLI prompt for your Cortex::

    cli>

Test your ingest
----------------

From the ``cmdr`` CLI, you can now query the data to make sure the nodes were created. 

**Example #1**

Use the following storm command to see the ``inet:fqdn`` nodes that were created::

    cli> storm inet:fqdn
    
Here's what you should see as a result::

    Executing query at 2021/08/24 14:12:43.876
        inet:fqdn=org
                .created = 2021/08/24 14:12:36.440
                :host = org
                :issuffix = True
                :iszone = False
        inet:fqdn=bbc-news.org
                .created = 2021/08/24 14:12:36.608
                :domain = org
                :host = bbc-news
                :issuffix = False
                :iszone = True
                :zone = bbc-news.org
        inet:fqdn=theguardiannews.org
                .created = 2021/08/24 14:12:36.440
                :domain = org
                :host = theguardiannews
                :issuffix = False
                :iszone = True
                :zone = theguardiannews.org
        inet:fqdn=com
                .created = 2021/08/24 14:12:36.593
                :host = com
                :issuffix = True
                :iszone = False
        inet:fqdn=nato-news.com
                .created = 2021/08/24 14:12:36.593
                :domain = com
                :host = nato-news
                :issuffix = False
                :iszone = True
                :zone = nato-news.com
        complete. 5 nodes in 45 ms (111/sec).

**Example #2**

Use the following storm command to count the number of DNS A records for the domain theguardiannews.org::

    storm inet:dns:a:fqdn=theguardiannews.org

Here's what you should see as a result::

    Executing query at 2021/08/24 14:50:17.543
        inet:dns:a=('theguardiannews.org', '12.131.129.89')
                .created = 2021/08/24 14:12:36.440
                .seen = ('2016/09/20 13:10:12.000', '2016/09/20 13:10:12.001')
                :fqdn = theguardiannews.org
                :ipv4 = 12.131.129.89
        inet:dns:a=('theguardiannews.org', '5.135.183.154')
                .created = 2021/08/24 14:12:36.573
                .seen = ('2015/12/11 10:57:12.000', '2015/12/14 10:59:15.000')
                :fqdn = theguardiannews.org
                :ipv4 = 5.135.183.154
        inet:dns:a=('theguardiannews.org', '31.210.118.89')
                .created = 2021/08/24 14:12:36.580
                .seen = ('2015/12/18 09:25:42.000', '2016/12/09 10:59:08.000')
                :fqdn = theguardiannews.org
                :ipv4 = 31.210.118.89
        inet:dns:a=('theguardiannews.org', '32.210.118.89')
                .created = 2021/08/24 14:12:36.586
                .seen = ('2015/12/17 00:00:00.000', '2015/12/17 18:17:55.000')
                :fqdn = theguardiannews.org
                :ipv4 = 32.210.118.89
        Counted 4 nodes.
        complete. 4 nodes in 349 ms (11/sec).

.. _Cortex: https://synapse.docs.vertex.link/en/latest/synapse/glossary.html#cortex
.. _the github repo: https://github.com/vertexproject/synapse-quickstart/archive/refs/heads/main.zip
.. _Get Docker: https://docs.docker.com/get-docker/
.. _Tools: https://synapse.docs.vertex.link/en/latest/synapse/userguides/index_tools.html#tools
.. _using csvtool: https://vertex.link/blogs/using-csvtool/
