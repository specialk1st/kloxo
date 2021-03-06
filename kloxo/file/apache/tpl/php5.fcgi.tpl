<?php
    $phpinipath = (isset($phpinipath)) ? $phpinipath : "/etc";
    $phpscanpath = (isset($phpscanpath)) ? $phpcanpath : "/etc/php.d";

    $maxchildren = (isset($maxchildren)) ? $maxchildren : '6';
    $maxrequests = (isset($maxrequests)) ? $maxrequests : '1000';
    $phpcgipath = (isset($phpcgipath)) ? $phpcgipath : '/usr/bin/php-cgi';
?>
#!/bin/sh

php_rc='<?php echo $phpinipath; ?>'
php_scan='<?php echo $phpscanpath; ?>'
php_prog='<?php echo $phpcgipath; ?>'

#export PHPRC=$php_rc
export PHP_INI_SCAN_DIR=$php_scan
export PHP_FCGI_CHILDREN=<?php echo $maxchildren; ?>

export PHP_FCGI_MAX_REQUESTS=<?php echo $maxrequests; ?>


exec $php_prog -c $php_rc $*
