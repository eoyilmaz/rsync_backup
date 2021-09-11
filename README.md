# rsync_backup
rsync based incremental backup system

This is a ``rsync`` based backup system.

To customize the system:

  * Copy and rename the ``sample_config.sh`` file to ``config.sh`` and
    update it accordingly.

  * Copy and rename the ``sample_filter_rules`` file to ``filter_rules`` and
    update it.

  * Check your configuration use ``verify_config.sh``.

  * If everything is okay, run ``backUp.sh``.

It should also work under Windows with Cygwin. But it has not been tested under Windows yet.
