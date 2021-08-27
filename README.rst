Synapse Quickstart
##################

Get started using Synapse Open-Source to start a `Cortex`_ and try it out! 

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

To make sure your ``Cortex`` is running, lets run the ``Storm`` CLI, manually
add a node, and quit.

Execute the storm CLI from the linux root shell::

    root@77c281dcf338:/# python -m synapse.tools.storm cell:///vertex/storage

    Welcome to the Storm interpreter!

    Local interpreter (non-storm) commands may be executed with a ! prefix:
        Use !quit to exit.
        Use !help to see local interpreter commands.

    storm>

Manually add an ``inet:user`` node::

    storm> [ inet:user=visi ]
    ..
    inet:user=visi
            .created = 2021/08/25 15:06:29.227
    complete. 1 nodes in 22 ms (45/sec).
    storm>

Quit the storm CLI::

    storm> !quit
    o/
    root@77c281dcf338:/#

Using Synapse Tools
===================

Once you have your Cortex started, you should be able to execute Synapse `Tools`_, such as ``storm`` or ``csvtool`` from the shell prompt. ::

    python -m synapse.tools.storm cell:///vertex/storage

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
    python -m synapse.tools.csvtool --csv-header --cortex cell:///vertex/storage ingest.storm ingest.csv

Test your ingest
----------------

From the ``Storm`` CLI, you can now query the data to make sure the nodes were created. 

**Example #1**

Use the following storm command to display the newly added ``inet:dns:a`` records::

    storm> inet:dns:a

Here's what you should see as a result::

    inet:dns:a=('bbc-news.org', '207.180.214.158')
            .created = 2021/08/24 11:54:33.958
            .seen = ('2019/04/15 07:16:09.364', '2019/04/24 07:31:37.271')
            :fqdn = bbc-news.org
            :ipv4 = 207.180.214.158
    inet:dns:a=('theguardiannews.org', '12.131.129.89')
            .created = 2021/08/24 11:54:33.941
            .seen = ('2016/09/20 13:10:12.000', '2016/09/20 13:10:12.001')
            :fqdn = theguardiannews.org
            :ipv4 = 12.131.129.89
    inet:dns:a=('theguardiannews.org', '32.210.118.89')
            .created = 2021/08/24 11:54:33.954
            .seen = ('2015/12/17 00:00:00.000', '2015/12/17 18:17:55.000')
            :fqdn = theguardiannews.org
            :ipv4 = 32.210.118.89
    inet:dns:a=('bbc-news.org', '192.64.119.28')
            .created = 2021/08/24 11:54:33.960
            .seen = ('2019/04/18 19:04:01.000', '2019/04/19 07:31:27.360')
            :fqdn = bbc-news.org
            :ipv4 = 192.64.119.28
    inet:dns:a=('theguardiannews.org', '5.135.183.154')
            .created = 2021/08/24 11:54:33.951
            .seen = ('2015/12/11 10:57:12.000', '2015/12/14 10:59:15.000')
            :fqdn = theguardiannews.org
            :ipv4 = 5.135.183.154
    inet:dns:a=('bbc-news.org', '217.160.182.197')
            .created = 2021/08/24 11:54:33.961
            .seen = ('2015/05/03 10:31:14.000', '2015/05/03 10:31:14.001')
            :fqdn = bbc-news.org
            :ipv4 = 217.160.182.197
    inet:dns:a=('theguardiannews.org', '31.210.118.89')
            .created = 2021/08/24 11:54:33.953
            .seen = ('2015/12/18 09:25:42.000', '2016/12/09 10:59:08.000')
            :fqdn = theguardiannews.org
            :ipv4 = 31.210.118.89
    inet:dns:a=('nato-news.com', '185.82.202.174')
            .created = 2021/08/24 11:54:33.955
            .seen = ('2015/10/10 00:00:00.000', '2016/09/28 05:30:53.000')
            :fqdn = nato-news.com
            :ipv4 = 185.82.202.174
    complete. 8 nodes in 9 ms (888/sec).

.. _Cortex: https://synapse.docs.vertex.link/en/latest/synapse/glossary.html#cortex
.. _the github repo: https://github.com/vertexproject/synapse-quickstart/archive/refs/heads/main.zip
.. _Get Docker: https://docs.docker.com/get-docker/
.. _Tools: https://synapse.docs.vertex.link/en/latest/synapse/userguides/index_tools.html#tools
.. _using csvtool: https://vertex.link/blogs/using-csvtool/
