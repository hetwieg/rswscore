<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

require('config.php');
require('database.php');
require('global.php');

?>
<!doctype html>
<html lang="nl">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="/css/app.css">
        <title>RSW 2018</title>

        <link rel='stylesheet' id='generate-fonts-css'  href='//fonts.googleapis.com/css?family=Exo+2:regular|Audiowide:regular' type='text/css' media='all' />
        <link rel='stylesheet' id='fl-builder-layout-30-css'  href='http://rswmaasdelta.nl/2018/wp-content/uploads/bb-plugin/cache/30-layout.css?ver=3d2cc363e0199fedd2ad36fb71d23509' type='text/css' media='all' />
        <link rel='stylesheet' id='cff-css'  href='http://rswmaasdelta.nl/2018/wp-content/plugins/custom-facebook-feed/css/cff-style.css?ver=2.5.2' type='text/css' media='all' />
        <link rel='stylesheet' id='sb-font-awesome-css'  href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css' type='text/css' media='all' />
        <link rel='stylesheet' id='sb_instagram_styles-css'  href='http://rswmaasdelta.nl/2018/wp-content/plugins/instagram-feed/css/sb-instagram.min.css?ver=1.8.2' type='text/css' media='all' />
        <link rel='stylesheet' id='generate-style-grid-css'  href='http://rswmaasdelta.nl/2018/wp-content/themes/generatepress/css/unsemantic-grid.min.css?ver=2.0.2' type='text/css' media='all' />
        <link rel='stylesheet' id='generate-style-css'  href='http://rswmaasdelta.nl/2018/wp-content/themes/generatepress/style.min.css?ver=2.0.2' type='text/css' media='all' />
        <style id='generate-style-inline-css' type='text/css'>
         body{background-color:#efefef;color:#3a3a3a;}a, a:visited{color:#1e73be;text-decoration:none;}a:hover, a:focus, a:active{color:#6f8bae;text-decoration:none;}body .grid-container{max-width:1100px;}body, button, input, select, textarea{font-family:"Exo 2", sans-serif;}p{margin-bottom:0.7em;}.main-navigation a, .menu-toggle{font-family:"Audiowide", display;font-size:16px;}.main-navigation .main-nav ul ul li a{font-size:15px;}h1{font-family:"Audiowide", display;font-weight:bold;}h2{font-family:"Audiowide", display;font-weight:bold;}h3{font-family:"Audiowide", display;font-weight:bold;}h4{font-family:"Audiowide", display;}@media (max-width:768px){.main-title{font-size:30px;}h1{font-size:30px;}h2{font-size:25px;}}.top-bar{background-color:#636363;color:#ffffff;}.top-bar a,.top-bar a:visited{color:#ffffff;}.top-bar a:hover{color:#303030;}.site-header{background-color:rgba(255,255,255,0);color:#3a3a3a;}.site-header a,.site-header a:visited{color:#3a3a3a;}.main-title a,.main-title a:hover,.main-title a:visited{color:#222222;}.site-description{color:#999999;}.main-navigation,.main-navigation ul ul{background-color:rgba(57,84,122,0.64);}.main-navigation .main-nav ul li a,.menu-toggle{color:#ffffff;}.main-navigation .main-nav ul li:hover > a,.main-navigation .main-nav ul li:focus > a, .main-navigation .main-nav ul li.sfHover > a{color:#ffffff;background-color:#6f8bae;}button.menu-toggle:hover,button.menu-toggle:focus,.main-navigation .mobile-bar-items a,.main-navigation .mobile-bar-items a:hover,.main-navigation .mobile-bar-items a:focus{color:#ffffff;}.main-navigation .main-nav ul li[class*="current-menu-"] > a{color:#ffffff;background-color:rgba(111,139,174,0.52);}.main-navigation .main-nav ul li[class*="current-menu-"] > a:hover,.main-navigation .main-nav ul li[class*="current-menu-"].sfHover > a{color:#ffffff;background-color:rgba(111,139,174,0.52);}.navigation-search input[type="search"],.navigation-search input[type="search"]:active{color:#6f8bae;background-color:#6f8bae;}.navigation-search input[type="search"]:focus{color:#ffffff;background-color:#6f8bae;}.main-navigation ul ul{background-color:#39547a;}.main-navigation .main-nav ul ul li a{color:#ffffff;}.main-navigation .main-nav ul ul li:hover > a,.main-navigation .main-nav ul ul li:focus > a,.main-navigation .main-nav ul ul li.sfHover > a{color:#ffffff;background-color:#6f8bae;}.main-navigation .main-nav ul ul li[class*="current-menu-"] > a{color:#ffffff;background-color:rgba(111,139,174,0.52);}.main-navigation .main-nav ul ul li[class*="current-menu-"] > a:hover,.main-navigation .main-nav ul ul li[class*="current-menu-"].sfHover > a{color:#ffffff;background-color:rgba(111,139,174,0.52);}.separate-containers .inside-article, .separate-containers .comments-area, .separate-containers .page-header, .one-container .container, .separate-containers .paging-navigation, .inside-page-header{background-color:#dce6f1;}.entry-meta{color:#888888;}.entry-meta a,.entry-meta a:visited{color:#666666;}.entry-meta a:hover{color:#1e73be;}.sidebar .widget{background-color:#ffffff;}.sidebar .widget .widget-title{color:#000000;}.footer-widgets{background-color:#ffffff;}.footer-widgets .widget-title{color:#000000;}.site-info{color:#ffffff;background-color:rgba(57,84,122,0.64);}.site-info a,.site-info a:visited{color:#ffffff;}.site-info a:hover{color:#6f8bae;}.footer-bar .widget_nav_menu .current-menu-item a{color:#6f8bae;}input[type="text"],input[type="email"],input[type="url"],input[type="password"],input[type="search"],input[type="tel"],input[type="number"],textarea,select{color:#666666;background-color:#fafafa;border-color:#cccccc;}input[type="text"]:focus,input[type="email"]:focus,input[type="url"]:focus,input[type="password"]:focus,input[type="search"]:focus,input[type="tel"]:focus,input[type="number"]:focus,textarea:focus,select:focus{color:#666666;background-color:#ffffff;border-color:#bfbfbf;}button,html input[type="button"],input[type="reset"],input[type="submit"],a.button,a.button:visited{color:#ffffff;background-color:#666666;}button:hover,html input[type="button"]:hover,input[type="reset"]:hover,input[type="submit"]:hover,a.button:hover,button:focus,html input[type="button"]:focus,input[type="reset"]:focus,input[type="submit"]:focus,a.button:focus{color:#ffffff;background-color:#3f3f3f;}.generate-back-to-top,.generate-back-to-top:visited{background-color:rgba( 0,0,0,0.4 );color:#ffffff;}.generate-back-to-top:hover,.generate-back-to-top:focus{background-color:rgba( 0,0,0,0.6 );color:#ffffff;}.inside-header{padding:0px;}.separate-containers .inside-article, .separate-containers .comments-area, .separate-containers .page-header, .separate-containers .paging-navigation, .one-container .site-content, .inside-page-header{padding:20px 15px 15px 15px;}@media (max-width:768px){.separate-containers .inside-article, .separate-containers .comments-area, .separate-containers .page-header, .separate-containers .paging-navigation, .one-container .site-content, .inside-page-header{padding:15px;}}.one-container.right-sidebar .site-main,.one-container.both-right .site-main{margin-right:15px;}.one-container.left-sidebar .site-main,.one-container.both-left .site-main{margin-left:15px;}.one-container.both-sidebars .site-main{margin:0px 15px 0px 15px;}.separate-containers .widget, .separate-containers .site-main > *, .separate-containers .page-header, .widget-area .main-navigation{margin-bottom:0px;}.right-sidebar.separate-containers .site-main{margin:0px;}.left-sidebar.separate-containers .site-main{margin:0px;}.both-sidebars.separate-containers .site-main{margin:0px;}.both-right.separate-containers .site-main{margin:0px;}.both-right.separate-containers .inside-left-sidebar{margin-right:0px;}.both-right.separate-containers .inside-right-sidebar{margin-left:0px;}.both-left.separate-containers .site-main{margin:0px;}.both-left.separate-containers .inside-left-sidebar{margin-right:0px;}.both-left.separate-containers .inside-right-sidebar{margin-left:0px;}.separate-containers .site-main{margin-top:0px;margin-bottom:0px;}.separate-containers .page-header-image, .separate-containers .page-header-contained, .separate-containers .page-header-image-single, .separate-containers .page-header-content-single{margin-top:0px;}.separate-containers .inside-right-sidebar, .separate-containers .inside-left-sidebar{margin-top:0px;margin-bottom:0px;}.main-navigation .main-nav ul li a,.menu-toggle,.main-navigation .mobile-bar-items a{line-height:45px;}.main-navigation .main-nav ul ul li a{padding:8px 20px 8px 20px;}.main-navigation ul ul{top:auto;}.navigation-search, .navigation-search input{height:100%;}.rtl .menu-item-has-children .dropdown-menu-toggle{padding-left:20px;}.menu-item-has-children ul .dropdown-menu-toggle{padding-top:8px;padding-bottom:8px;margin-top:-8px;}.rtl .main-navigation .main-nav ul li.menu-item-has-children > a{padding-right:20px;}.navigation-search, .navigation-search input{height:100%;}/* End cached CSS */
         body{background-image:url('http://rswmaasdelta.nl/2018/wp-content/uploads/2018/03/500px-Tileable_Background_Images.jpg');}.site-header{background-repeat:no-repeat;background-size:cover;background-position:left;}.separate-containers .inside-article,.separate-containers .comments-area,.separate-containers .page-header,.one-container .container,.separate-containers .paging-navigation,.separate-containers .inside-page-header{background-image:url('http://rswmaasdelta.nl/2018/wp-content/uploads/2018/03/bg-1.jpg');}
         .slideout-navigation.main-navigation .main-nav ul li a{font-weight:normal;text-transform:none;font-size:16px;}.slideout-navigation.main-navigation .main-nav ul ul li a{font-size:15px;}
        </style>
        <link rel='stylesheet' id='generate-mobile-style-css'  href='http://rswmaasdelta.nl/2018/wp-content/themes/generatepress/css/mobile.min.css?ver=2.0.2' type='text/css' media='all' />
        <link rel='stylesheet' id='font-awesome-essentials-css'  href='http://rswmaasdelta.nl/2018/wp-content/themes/generatepress/css/font-awesome-essentials.min.css?ver=4.7' type='text/css' media='all' />
        <link rel='stylesheet' id='sccss_style-css'  href='http://rswmaasdelta.nl/2018?sccss=1&#038;ver=4.9.5' type='text/css' media='all' />
        <script type='text/javascript' src='http://rswmaasdelta.nl/2018/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
        <script type='text/javascript' src='http://rswmaasdelta.nl/2018/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
        <link rel='https://api.w.org/' href='http://rswmaasdelta.nl/2018/wp-json/' />
        <link rel="EditURI" type="application/rsd+xml" title="RSD" href="http://rswmaasdelta.nl/2018/xmlrpc.php?rsd" />
        <link rel="wlwmanifest" type="application/wlwmanifest+xml" href="http://rswmaasdelta.nl/2018/wp-includes/wlwmanifest.xml" /> 
        <meta name="generator" content="WordPress 4.9.5" />
        <link rel="canonical" href="http://rswmaasdelta.nl/2018/" />
        <link rel='shortlink' href='http://rswmaasdelta.nl/2018/' />
        <link rel="alternate" type="application/json+oembed" href="http://rswmaasdelta.nl/2018/wp-json/oembed/1.0/embed?url=http%3A%2F%2Frswmaasdelta.nl%2F2018%2F" />
        <link rel="alternate" type="text/xml+oembed" href="http://rswmaasdelta.nl/2018/wp-json/oembed/1.0/embed?url=http%3A%2F%2Frswmaasdelta.nl%2F2018%2F&#038;format=xml" />
        <meta name="viewport" content="width=device-width, initial-scale=1">		<style type="text/css">.recentcomments a{display:inline !important;padding:0 !important;margin:0 !important;}</style>
		    
    </head>
    <body class="home page-template-default page page-id-30 wp-custom-logo fl-builder sticky-menu-fade  no-sidebar nav-below-header fluid-header one-container active-footer-widgets-0 nav-aligned-left header-aligned-center dropdown-hover">
        <header itemtype="http://schema.org/WPHeader" itemscope="itemscope" id="masthead" class="site-header">
			      <div class="inside-header">
				        <div class="site-logo">
				            <a href="http://rswmaasdelta.nl/2018/" title="RSW Maasdelta 2018" rel="home">
					              <img class="header-image" alt="RSW Maasdelta 2018" src="http://rswmaasdelta.nl/2018/wp-content/uploads/2018/03/Banner2.png" title="RSW Maasdelta 2018">
				            </a>
			          </div>			</div><!-- .inside-header -->
		    </header>
        
        <!-- Popups -->
        <div role="dialog" id="tocht-tijden" aria-hidden="true" class="modal fade" data-bind="modal: { show: tijdenVisible }">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content" data-bind="with: selectLogTeam">
                    <div class="modal-header">
                        <h5 class="modal-title" id="tocht-tijden-label">
                            Tijden: <span data-bind="text: naam">[team.naam]</span>
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th>Aankomst</th>
                                    <th>Vertrek</th>
                                    <th>Gelopen</th>
                                    <th>Post</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: route">
                                <tr data-bind="css:'table-'+state()">
                                    <td data-bind="text: nummer_naam"></td>
                                    <td><input type="time" data-bind="visible: type_post() != 'start', date: aangekome" /></td>
                                    <td><input type="time" data-bind="visible: type_post() != 'stop', date: vertrokke" /></td>
                                    <td><span data-bind="visible: type_post() != 'start', time: gelope"></span></td>
                                    <td><span data-bind="visible: type_post() == 'post', time: post"></span></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Totaal:</th>
                                    <th colspan="2"></th>
                                    <th><span data-bind="time: gelope"></span></th>
                                    <th><span data-bind="time: post"></span></th>                        
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <span class="rounded bg-default">Niet bezocht</span> 
                        <span class="rounded bg-warning">Op post</span>
                        <span class="rounded bg-success">Vertrokke</span>
                        <span class="rounded bg-danger">Tijden kloppen niet</span>
                    </div>
                </div>
            </div>
        </div>
        
        <div role="dialog" id="post-vertrokke" aria-hidden="true" class="modal fade" data-bind="modal: { show: vertrokkeVisible }">
            <div class="modal-dialog" role="document">
                <div class="modal-content" data-bind="with: selectPost">
                    <div class="modal-header">
                        <h5 class="modal-title" id="post-vertrokke-label">Vertrokke</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nr</th>
                                    <th>Naam</th>
                                    <th>Wanneer</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: vertrokke">
                                <tr>
                                    <td data-bind="text: team.nummer"></td>
                                    <td data-bind="text: team.naam"></td>
                                    <td data-bind="timer: vertrokke"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        
        <div role="dialog" id="post-checkin" aria-hidden="true" class="modal fade" data-bind="modal: { show: checkInVisible }">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content" data-bind="with: selectTeamCheckIn">
                    <div class="modal-header">
                        <h5 class="modal-title" id="post-checkin-label">Check in: <span data-bind="text: naam"></span></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Door op check in te klikken word <b data-bind="text: naam"></b> aan uw post toegevoegd.
                        <div data-bind="visible: !true"> //TODO: Maak deze melding dynames
                            <h4 class="text-danger">Dit team is al op uw post geweest</h4>
                            Door dit team opnieuw op uw post in te chekken word de vorige tijd van check in verwijdert
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                            Annuleren
                        </button>
                        
                        <button type="button" class="btn btn-success" data-bind="click: checkInOk">Check in</button>          
                    </div>
                </div>
            </div>
        </div>
        
        <div role="dialog" id="post-vertrek" aria-hidden="true" class="modal fade" data-bind="modal: { show: vertrekVisible }">
            <div class="modal-dialog" role="document">
                <div class="modal-content" data-bind="with: selectVertrek">
                    <div class="modal-header">
                        <h5 class="modal-title" id="post-vertrek-label">Check uit voor:
                            <span data-bind="text: team.naam"></span>
                            (<span data-bind="text: route"></span>)
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row" data-bind="visible: !false">
                            <label class="col-sm-2 col-form-label" for="team_score_vertrokke">Punten</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="team_score_vertrokke" aria-describedby="team_score_vertrokkeHelp" placeholder="" data-bind="value: scoreT">
                                <small id="team_score_vertrokkeHelp" class="form-text text-muted">
                                    Punten behaald voor opdrachten op deze post
                                </small>
                            </div>
                        </div>            
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                            Annuleren
                        </button>
                        
                        <button type="button" class="btn btn-success" data-bind="click: checkOut">Check uit</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main -->
        <main role="main" class="container" data-bind="visible: false">
            <h1 class="text-center">Gegevens worde geladen.</h1>
            <small>Wanneer de server offline is duurt dit heel lang.</small>
        </main>
        
        <main role="main" id="page" class="container hfeed site grid-container container grid-parent" style="display: none" data-bind="visible: true">
            <div class="" data-bind="with: selectPost">
                <div class="heading">
                    <h2 data-bind="text: naam"></h2>
                </div>
                
                <div class="body">
                    <div data-bind="visible: aanwezig().length > 0">
                        <h3>Aanwezig</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nr</th>
                                    <th>Naam</th>
                                    <th data-bind="visible: type_post() != 'start'">Tijd</th>
                                    <th data-bind="visible: type_post() != 'stop'">Check uit</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: aanwezig">
                                <tr>
                                    <td data-bind="text: team.nummer"></td>
                                    <td data-bind="text: team.naam"></td>
                                    <td data-bind="timer: aangekome, visible: type_post() != 'start'"></td>
                                    <td data-bind="visible: type_post() != 'stop'">
                                        <button type="button" class="btn btn-sm btn-secondary" data-bind="click: vertrek">Check uit</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div data-bind="visible: aanwezig().length == 0">
                        <h3>Aanwezig</h3>
                        Momenteel is er niemand aanwezig op uw post
                    </div>                        
                    
                    
                    <div data-bind="visible: type_post() != 'start' && verwacht().length > 0">
                        <h3>Verwacht</h3>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Nr</th>
                                    <th>Naam</th>
                                    <th>Vertokke op vorige post</th>
                                    <th>Check in</th>
                                </tr>
                            </thead>
                            <tbody data-bind="foreach: verwacht">
                                <tr>
                                    <td data-bind="text: team.nummer"></td>
                                    <td data-bind="text: team.naam"></td>
                                    <td data-bind="timer: vertrokke"></td>
                                    <td><button class="btn btn-sm btn-secondary" data-bind="click: team.checkIn">Check in</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div data-bind="visible: verwacht().length == 0 && type_post() != 'start'">
                        <h3>Verwacht</h3>
                        Volgens de vertrektijden is er niemand verwacht op uw post, maar er kunnen ploegen aankomen die niet op de vorige post zijn geweest.
                    </div>                        
                    
                    
                    <div class="btn-toolbar" role="toolbar" aria-label="Post acties">
                        <div class="btn-group mr-2" role="group" data-bind="visible: type_post() != 'start'">
                            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Check in voor een ander team
                            </button>
                            <div class="dropdown-menu">
                                <!-- ko foreach: $root.kampen -->
                                <h6 class="dropdown-header" data-bind="text: naam"></h6>
                                <!-- ko foreach: teams -->
                                <a class="dropdown-item" href="#" data-bind="click: checkIn">
                                    <span data-bind="text: nummer"></span>.
                                    <span data-bind="text: naam"></span>
                                </a>
                                <!-- /ko -->
                                <!-- /ko -->
                            </div>
                        </div>
                        
                        <div class="btn-group mr-2" role="group" data-bind="visible: type_post() != 'stop'">
                            <button type="button" class="btn btn-info" data-bind="click: toonVertrokke" >Toon vertrokke teams</button>
                        </div>
                        
                        <?php if(in_array('team.update.route', $user['auth'])) { ?>
                            <div class="btn-group mr-2" role="group">
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Wissel van post
                                </button>
                                <div class="dropdown-menu">
                                    <!-- ko foreach: $root.posten -->
                                    <a class="dropdown-item" href="#" data-bind="click: $root.selectPost">
                                        <span data-bind="text: naam"></span>
                                    </a>
                                    <!-- /ko -->
                                </div>
                            </div>  
                        <?php } ?>
                    </div>
                </div>
            </div>
            
            <div data-bind="with: selectTeam">
                <div class="heading">
                    <h2 data-bind="text: naam"></h2>
                </div>
                
                <div class="body">
                    Op de volgende posten ben je geweest,
                    <ul data-bind="foreach: route" style="list-style-type: none;">
                        <li data-bind="visible: type_post() == 'post' && aangekome() > 0">
                            <span class="rounded" data-bind="text: nummer, css: 'bg-'+state()"></span>
                            <span data-bind="text: naam"></span>
                        </li>
                    </ul>
                    Het laatste wat we gezien hebben is dat: <span data-bind="text: lastAction"></span>
                </div>
            </div>
            
            <div data-bind="visible: !selectActive()">
                <div class="heading">
                    <h2>RSW 2018</h2>
                </div>
                
                <div class="body">
                    Leuk dat je deze pagina bekijkt, maar scan een code voor meer info.
                </div>
            </div>
        </main>
        
        <div class="site-footer grid-container grid-parent  ">
			      <footer class="site-info" itemtype="http://schema.org/WPFooter" itemscope="itemscope">
			          <div class="inside-site-info grid-container grid-parent">
                    <span class="text-muted">Laaste update: <b data-bind="timer: lastTime">server offline</b></span>
                    
                    <div class="copyright-bar">
					              <a href="//rswmaasdelta.nl/2018">RSW Maasdelta</a> 2018 © 				</div>
			          </div>
                
		        </footer><!-- .site-info -->
		    </div>
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="/js/jquery-3.3.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="/js/moment-with-locales.min.js"></script>
        <script src="/js/knockout-3.4.2.js"></script>
        <script src="/js/knockout-bindings.js"></script>
        <script src="/js/app.js?<?php echo time(); ?>?>"></script>
        <script>
         function firstUpdateDone() {
             <?php if($user['id'] > 0) { ?>
             
             ko.unwrap(selfView.posten).forEach(function(post) {
                 if(post.id == <?php echo $user['post']; ?>) {
                     selfView.selectPost(post);
                 }
             });
             
             <?php
             } // if(user[id] > 0)
             
             if($team['id'] > 0) {
             ?>             
             
             ko.unwrap(selfView.teams).forEach(function(team) {
                 if(team.id == <?php echo $team['id']; ?>) {
                     <?php
                     if($user['id'] > 0) {
                         echo 'team.checkIn();';
                     }
                     else {
                         echo 'selfView.selectTeam(team);';
                     }
                     ?>
                 }
             });
             
             <?php } // if(team[id] > 0) ?>

         }
        </script>
    </body>
</html>
