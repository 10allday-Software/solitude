#
# %(header)s
#

MAILTO=amo-developers@10allday.com

HOME=/tmp

# Every 10 minutes run the stats log for today so we can see progress.
*/10 * * * * %(django)s log --type=stats --today %(dir)s

# Once per day, generate stats log for yesterday so that we have a final log.
05 0 * * * %(django)s log --type=stats %(dir)s

# Once per day, generate revenue log for monolith for yesterday.
10 0 * * * %(django)s log --type=revenue %(dir)s

# Once per day, clean statuses older than BANGO_STATUSES_LIFETIME setting.
35 0 * * * %(django)s clean_statuses

MAILTO=root
