config.load_autoconfig()
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.preferred_color_scheme","dark")
c.fonts.default_size = '14pt'
config.set("auto_save.session", True)
config.set("zoom.default", "150%")

# bindings
config.bind(';w', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind('pt', 'tab-pin')

# spell check -> install by using dictcli in /usr/share/qutebrowser/scripts
c.spellcheck.languages = ["en-US", "de-DE", "fa-IR"]

# search engines
c.url.searchengines = {
        'st': 'https://www.startpage.com/do/metasearch.pl?query={}',
        'dd': 'https://duckduckgo.com/?q={}',
        'DEFAULT': 'https://www.startpage.com/do/metasearch.pl?query={}'
        }

