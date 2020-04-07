module.exports = {
  head: [
    ['link', { rel: 'icon', href: '/favicon.png' }] //favicon
  ],
  themeConfig: {
    logo: '/nitrokey_logo_nur_schild_rot.svg',
    nav: [
      { text: 'Home', link: '/' },
      {
        text: 'Products',
        ariaLabel: 'Product Menu',
        items: [
          { text: 'Nitrokey FIDO2',link: '/fido2/' },
          { text: 'Nitrokey FIDO U2F', link: '/u2f/' },
          { text: 'Nitrokey HSM', link: '/hsm/' },
          { text: 'Nitrokey Pro', link: '/pro/' },
          { text: 'Nitrokey Start', link: '/start/' },
          { text: 'Nitrokey Storage', link: '/storage/' },
          { text: 'NitroPad X230', link: '/x230/' },
        ]
      }
    ],
    sidebar: {
      sidebarDepth: 2, // seems to be ignored TODO

      // NK FIDO2 menu
      '/fido2/windows/': [
        ['', 'Nitrokey FIDO2, Windows'],
        'b',
      ],

      '/fido2/mac/': [
        ['', 'Nitrokey FIDO2, macOS'],
      ],

      '/fido2/linux/': [
        ['', 'Nitrokey FIDO2, Linux'],
        '1',
        '2',
      ],

      // NK HSM menu
      '/hsm/windows/': [
        ['', 'Nitrokey HSM, Windows'],
      ],

      '/hsm/mac/': [
        ['', 'Nitrokey HSM, macOS'],
      ],

      '/hsm/linux/': [
        ['', 'Nitrokey HSM, Linux'],
      ],

      // NK Pro menu
      '/pro/windows/': [
        ['', 'Nitrokey Pro 2, Windows'],
        'OpenPGP Email Encryption',
        'SMIME Email Encryption',
      ],

      '/pro/mac/': [
        ['', 'Nitrokey Pro 2, macOS'],
      ],

      '/pro/linux/': [
        ['', 'Nitrokey Pro 2, Linux'],
      ],

      // NK Start menu
      '/start/windows/': [
        ['', 'Nitrokey Start, Windows'],
      ],

      '/start/mac/': [
        ['', 'Nitrokey Start, macOS'],
      ],

      '/start/linux/': [
        ['', 'Nitrokey Start, Linux'],
      ],

      // NK Storage menu
      '/storage/windows/': [
        ['', 'Nitrokey Storage, Windows'],
      ],

      '/storage/mac/': [
        ['', 'Nitrokey Storage, macOS'],
      ],

      '/storage/linux/': [
        ['', 'Nitrokey Storage, Linux'],
      ],

      // NK FIDO U2F menu
      '/u2f/windows/': [
        ['', 'Nitrokey FIDO U2F, Windows'],
      ],

      '/u2f/mac/': [
        ['', 'Nitrokey FIDO U2F, macOS'],
      ],

      '/u2f/linux/': [
        ['', 'Nitrokey FIDO U2F, Linux'],
      ],

      // NitroPad X230
      '/x230/qubes/': [
        ['', 'NitroPad X230, Qubes OS'],
        ['verify-sealed-hardware', 'Verify Sealed Hardware'],
        ['operating-system-update', 'Operating System Update'],
      ],

      '/x230/ubuntu/': [
        ['', 'NitroPad X230, Ubuntu Linux'],
        'a',
      ],

      // Main overview and fallback menu
      '/': [
        {
          title: 'Nitrokey FIDO2',
          path: '/fido2/', 
          children: [
            ['/fido2/windows/', 'Windows'],
            ['/fido2/mac/', 'macOS'],
            ['/fido2/linux/', 'Linux'],
          ]
        },
        {
          title: 'Nitrokey FIDO U2F',
          children: [
            ['/u2f/windows/', 'Windows'],
            ['/u2f/mac/', 'macOS'],
            ['/u2f/linux/', 'Linux'],
          ]
        },
        {
          title: 'Nitrokey HSM 2',
          children: [
            ['/hsm/windows/', 'Windows'],
            ['/hsm/mac/', 'macOS'],
            ['/hsm/linux/', 'Linux'],
          ]
        },
        {
          title: 'Nitrokey Pro 2',
          children: [
            ['/pro/windows/', 'Windows'],
            ['/pro/mac/', 'macOS'],
            ['/pro/linux/', 'Linux'],
          ]
        },
        {
          title: 'Nitrokey Start',
          children: [
            ['/start/windows/', 'Windows'],
            ['/start/mac/', 'macOS'],
            ['/start/linux/', 'Linux'],
          ]
        },
        {
          title: 'Nitrokey Storage 2',
          children: [
            ['/storage/windows/', 'Windows'],
            ['/storage/mac/', 'macOS'],
            ['/storage/linux/', 'Linux'],
          ]
        },
        {
          title: 'NitroPad X230',
          children: [
            ['/x230/qubes/', 'Qubes OS'],
            ['/x230/ubuntu/', 'Ubuntu Linux'],
          ]
        },
      ]
    },
//    displayAllHeaders: true,
    lastUpdated: 'Last Updated', // string | boolean
    repo: 'Nitrokey/nitrokey-documentation',
    repoLabel: 'Contribute!',
    editLinks: true,
    editLinkText: 'Help us improve this page!',
  },
  plugins: ['@vuepress/back-to-top'],
  locales: {
    // The key is the path for the locale to be nested under.
    // As a special case, the default locale can use '/' as its path.
    '/': {
      lang: 'English', // this will be set as the lang attribute on <html>
      title: 'Nitrokey Documentation',
      description: 'User documentation of all Nitrokey products'
    },
    '/de/': {
      lang: 'Deutsch',
      title: 'Nitrokey Dokumentation',
      description: 'Benutzer-Dokumentation aller Nitrokey Produkte'
    }
  }
}
