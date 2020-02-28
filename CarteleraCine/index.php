<?php

require_once('smarty/libs/Smarty.class.php');

//Creo un objeto template
$miSmarty = new Smarty();

define('TEMPLATE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');
define('COMPILER_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/templates_c/');
define('CONFIG_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/config/');
define('CACHE_DIR', $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/tmp/cache/');
define(CONFIG_DIR, $_SERVER['DOCUMENT_ROOT'].'./CarteleraCine/templates/');

$miSmarty->template_dir = TEMPLATE_DIR;
$miSmarty->compile_dir = COMPILER_DIR;
$miSmarty->config_dir = CONFIG_DIR;
$miSmarty->cache_dir =CACHE_DIR;

$miSmarty->display("index.tpl");


?>