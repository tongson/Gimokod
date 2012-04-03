// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default browser checking.
pref("browser.shell.checkDefaultBrowser", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);

pref("browser.backspace_action", 2);
pref("accessibility.typeaheadfind", false);

// Gentoo
pref("app.update.enabled",                 false);
pref("app.update.autoInstallEnabled",      false);
pref("browser.link.open_external",         3);
pref("browser.shell.checkDefaultBrowser",  false);
pref("browser.EULA.override",              true);
pref("layout.css.dpi", 0);

// Pigfoot
pref("browser.enable_automatic_image_resizing", false);
pref("network.http.max-connections", 48);
pref("network.http.max-connections-per-server", 16);
pref("network.http.max-persistent-connections-per-proxy", 16);
pref("network.http.max-persistent-connections-per-server", 8);
pref("network.http.pipelining", true);
pref("network.http.proxy.pipelining", true);
pref("network.http.pipelining.maxrequests", 8);
pref("privacy.donottrackheader.enabled", true);

// http://www.junauza.com/2010/05/hacks-to-make-firefox-faster-than.html
pref("nglayout.initialpaint.delay", 0);
pref("content.notify.interval", 500000);
pref("content.notify.ontimer", true);
pref("content.switch.threshold", 250000);
pref("content.interrupt.parsing", false);
