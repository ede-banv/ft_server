<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
define( 'DB_NAME', 'wordpression' );

/** MySQL database username */
define( 'DB_USER', 'depression' );

/** MySQL database password */
define( 'DB_PASSWORD', 'owowhatsthis' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         '~{VB5fz(,{8|)5dqLQOu7uYj=*U3h5*{G?_1l{QM>Bu2%-9/Wa71{mr^?ZwSnp1J');
define('SECURE_AUTH_KEY',  'hOa7w@#5n{cw|$KT/W6F14|QbdK^2~,-`.NNs*0uGCbHf_(ei+ adJM_df0Gs+JN');
define('LOGGED_IN_KEY',    '[*4s]c4rl,!F>Ye|Hyn9l||5-uuu85yzNHG)Pc.q*!UD,0t{OiUZ<:>o$X+MbC]E');
define('NONCE_KEY',        'Sal2^%97{hd9H8qvXd4z0l2/8-}$-X|T6}sOmpO_o=^VOFbT:>-`i8=H-IWsIEZI');
define('AUTH_SALT',        '*GM/7e.lt+4)xRo@gtXd,|HGG+?:5+)l+H[GkDb<5$_y8`mjY`4NkSB@I[b1s@EH');
define('SECURE_AUTH_SALT', '|rhlO/vl =[aafXcnc*+f)~,f}!~<|Y.#W|p5O/Z&b}3-n|}?+PU-0V%|IG66>O9');
define('LOGGED_IN_SALT',   'G+GfF#-7a;oKR;e.j^[=|=mEOC1#*>4-(XTu&;!?2=sWa51%agf4hl|<n+ x-HGM');
define('NONCE_SALT',       '?gaM+Z@`pvC~V60zAhd(x/,ygC4bX>)C{:)^<bmjUh|isYRR4M3SLSl?EdR.w&/B');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );