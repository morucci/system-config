# == Class: openstack_project::users
#
class openstack_project::users {
  # Make sure we have our UID/GID account minimums for dynamic users set higher
  # than we'll use for static assignments, so as to avoid future conflicts.
  include openstack_project::params
  file { '/etc/login.defs':
    ensure => present,
    source => $::openstack_project::params::login_defs,
  }
  User::Virtual::Localuser {
    require => File['/etc/login.defs']
  }

  @user::virtual::localuser { 'mordred':
    realname => 'Monty Taylor',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLsTZJ8hXTmzjKxYh/7V07mIy8xl2HL+9BaUlt6A6TMsL3LSvaVQNSgmXX5g0XfPWSCKmkZb1O28q49jQI2n7n7+sHkxn0dJDxj1N2oNrzNY7pDuPrdtCijczLFdievygXNhXNkQ2WIqHXDquN/jfLLJ9L0jxtxtsUMbiL2xxZEZcaf/K5MqyPhscpqiVNE1MjE4xgPbIbv8gCKtPpYIIrktOMb4JbV7rhOp5DcSP5gXtLhOF5fbBpZ+szqrTVUcBX0oTYr3iRfOje9WPsTZIk9vBfBtF416mCNxMSRc7KhSW727AnUu85hS0xiP0MRAf69KemG1OE1pW+LtDIAEYp',
    key_id   => 'mordred@camelot',
    uid      => 2000,
    gid      => 2000,
  }

  @user::virtual::localuser { 'corvus':
    realname => 'James E. Blair',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAvKYcWK1T7e3PKSFiqb03EYktnoxVASpPoq2rJw2JvhsP0JfS+lKrPzpUQv7L4JCuQMsPNtZ8LnwVEft39k58Kh8XMebSfaqPYAZS5zCNvQUQIhP9myOevBZf4CDeG+gmssqRFcWEwIllfDuIzKBQGVbomR+Y5QuW0HczIbkoOYI6iyf2jB6xg+bmzR2HViofNrSa62CYmHS6dO04Z95J27w6jGWpEOTBjEQvnb9sdBc4EzaBVmxCpa2EilB1u0th7/DvuH0yP4T+X8G8UjW1gZCTOVw06fqlBCST4KjdWw1F/AuOCT7048klbf4H+mCTaEcPzzu3Fkv8ckMWtS/Z9Q==',
    key_id   => 'jeblair@operational-necessity',
    uid      => 2001,
    gid      => 2001,
  }

  @user::virtual::localuser { 'smaffulli':
    realname => 'Stefano Maffulli',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDD/zAvXaOUXCAT6/B4sCMu/38d/PyOIg/tYsYFAMgfDUzuZwkjZWNGrTpp/HFrOAZISER5KmOg48DKPvm91AeZOHfAXHCP6x9/FcogP9rmc48ym1B5XyIc78QVQjgN6JMSlEZsl0GWzFhQsPDjXundflY07TZfSC1IhpG9UgzamEVFcRjmNztnBuvq2uYVGpdI+ghmqFw9kfvSXJvUbj/F7Pco5XyJBx2e+gofe+X/UNee75xgoU/FyE2a6dSSc4uP4oUBvxDNU3gIsUKrSCmV8NuVQvMB8C9gXYR+JqtcvUSS9DdUAA8StP65woVsvuU+lqb+HVAe71JotDfOBd6f',
    key_id   => 'stefano@mattone-E6420',
    uid      => 2002,
    gid      => 2002,
  }

  @user::virtual::localuser { 'oubiwann':
    realname => 'Duncan McGreggor',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAttca0Lahzo1rskWcCGwYh71ADmUsn/6RNBd7H7WVsX+QTacq90fpNghFNTen4I7tC1p0IemwHcCOb1noeXkjxl7W5r7l0OhiqMHp/u2ao0F3dINryuNEww2IHRhY6GwwGJ+slv+i4/FviUgqHZVzopUon/9VY0mu1wfu3vTRw0qXsvqr09Jiavt/8gJ0Fa5PsYkf7l0edFk0scTmGp3G4HY/ZvnbChfZMg6L/xcGPtK/GbLYg6PGtLVVnubXMtxD9GZYhwrY0i9Z2egcRI2W7IznM4OGFzYgA9HZqylPoWt4+ghzC5azUlbO2u6+8HigJVblAGHRWcznEf/ZDR3erw==',
    key_id   => 'oubiwann@rhosgobel',
    uid      => 2003,
    gid      => 2003,
  }

  @user::virtual::localuser { 'rockstar':
    realname => 'Paul Hummer',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDd4dPOAooCImpPulKIH82LqahC2wtQAZS/bFjNRpEILaYQMPCEpSMpjQmhcjdq+OBtsHMbqkSR+ZEoDrkhsI3Y6NVyTlGeFfwCPNNt2VeuJlKqRHUxxecp0IPWGSNl+YI5rjO5hTIZEo9T+hngX2b4k7aPm/naGcBVETMdYDZt9yhX37w5irRFdMfNDdSa3VfrhqV3Jjge/sXA5Tv35s0O6R55Ww5KfZRTpAMesHWkH9ch6xaHgexLNyCtekZQKNRLR5FCk1SYdcV+BJNlmiyjH4Ed+Oy/dFlGWPNARGwNgEWbInROEqXdWvQf+ZAfuwo32umVmmPhFrBxDYrFR1Gp',
    key_id   => 'rockstar@spackrace.local',
    uid      => 2004,
    gid      => 2004,
  }

  @user::virtual::localuser { 'clarkb':
    realname => 'Clark Boylan',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDlH6SNieyGDWNl4b9TM+zUgk+XTXRtqxyYxNh1p5e00u/ZrZPVrc7buPhnTHzEde0ABX0vgnZI2rC5Hf9cYY0aRgLHDuikQ4CQHPucslgZ5linjtWx5AuURp+oaJRCj00UZubJsatUx5vz+D4MGRLYmL+MErftYdI4sBbolATfLVwjrmxsd6KF1BZ0+9eEv2Xrk+yXN1A5RGPKBiuE6viDMZxrOuy7IW8+TQZW1LrsbTCAD1b+J5Nx0z/Hn3Rz71zEibdwM9xgu5vROu3p9kdaxu+Ndg/SvCCWlzoLQSeIAmcfGUlWg9IjEc3sQexX9BmUAsKQtu3aZFgq2V7aqtDN',
    key_id   => 'boylandcl@boylancl1',
    uid      => 2005,
    gid      => 2005,
  }

  @user::virtual::localuser { 'rlane':
    realname => 'Ryan Lane',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCdtI7H+fsgSrjrdG8aGVcrN0GFW3XqLVsLG4n7JW4qH2W//hqgdL7A7cNVQNPoB9I1jAqvnO2Ct6wrVSh84QU89Uufw412M3qNSNeiGgv2c2KdxP2XBrnsLYAaJRbgOWJX7nty1jpO0xwF503ky2W3OMUsCXMAbYmYNSod6gAdzf5Xgo/3+eXRh7NbV1eKPrzwWoMOYh9T0Mvmokon/GXV5PiAA2bIaQvCy4BH/BzWiQwRM7KtiEt5lHahY172aEu+dcWxciuxHqkYqlKhbU+x1fwZJ+MpXSj5KBU+L0yf3iKySob7g6DZDST/Ylcm4MMjpOy8/9Cc6Xgpx77E/Pvd',
    key_id   => 'laner@Free-Public-Wifi.local',
    uid      => 2006,
    gid      => 2006,
  }

  @user::virtual::localuser { 'fungi':
    realname => 'Jeremy Stanley',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC1uFP7IuJLWZD12BJEHhakphaLfwe/rkvRJVM/JfywKuCZSXJo2HpRLw1dM8HAOlXfyrYRZ+O374rluw9RoL2KVyxWPo2Lac6XTKR4yacIgV3Mnx/j04hdHuNDZsVmONG1FDq+11pXuObYx5Of+yHDDQK35/7wDGRDv93QYhEwh8nYaW3Dol3HtqF0e4pjkAgQhjhqUk6A/+A4CQHgomQV8XkAxEdf0O37OhHZRCgTxmdgDykEZT72t3YbCXdmtnEmqEP9FzFM/CXryQ8nf9IWcfaw70bFbSgWFs12u1EeV7a3mubdy6HfC2E/OfxQnRI59CoqWVMOY8jCuTv7FdsX',
    key_id   => 'fungi-openstack-2013',
    uid      => 2007,
    gid      => 2007,
  }

  @user::virtual::localuser { 'ttx':
    realname => 'Thierry Carrez',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDIF2INBeJdT3nT3+3yac+DGRQVN7wPv/GTb/OPDocQhfGMeQP7JwSURiv1nrXGbbjzuip7l7vRJs4u4NqXkUi0GFj1aLBpUm2Z1NFFDn4cuZ5KCYX6rjVrDYIpj4OlOyzt9YGONvvH/dB2GHw8kYbN50OalFWQCS0TVzj9SQbO47B/TPdtLnh116yEP5AXZZUGgl+q533/x8+nxAxJKA9iAk3mSswl67gXc4pRo84pjwpx+R/52ha6RfmLkoNAEOqtr5MGx5gyW+WXsoLJBl2bjcfzYoQI7gPWRIn+rtCnDFi762TS54zstXxR1ww+ppmqHk04l2oprNoI0wr00Fsl',
    key_id   => 'ttx@stardust',
    uid      => 2008,
    gid      => 2008,
  }

  @user::virtual::localuser { 'rbryant':
    realname => 'Russell Bryant',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZVikFz5KoRg3gKdiSa3PQ0i2bN5+bUyc4lMMg6P+jEStVddwN+nAgpa3zJaokmNAOp+MjcGa7K1Zi4b9Fe2ufusTzSKdNVlRDiw0R4Lk0LwTIfkhLywKvgcAz8hkqWPUIgTMU4xIizh50KTL9Ttsu9ULop8t7urTpPE4TthHX4nz1Y9NwYLU0W8cWhzgRonBbqtGs/Lif0NC+TdWGkVyTaP3x1A48s0SMPcZKln1hDv7KbKdknG4XyS4jlr4qI+R+har7m2ED/PH93PSXi5QnT4U6laWRg03HTxpPKWq077u/tPW9wcbkgpBcYMmDKTo/NDPtoN+r/jkbdW7zKJHx',
    key_id   => 'russel@russelbryant.net',
    uid      => 2009,
    gid      => 2009,
  }

  @user::virtual::localuser { 'pabelanger':
    realname => 'Paul Belanger',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAv0YOn34s5fMC/VTw6tn2Js/7jXqWzee9Kbf4NNJ+WiBZ7rtV0F2Jhz9OjfRdja7d8X3M01NFoufPJm5hpMEAvguxSoL0/lm44dcZ7QKT9tfmreAXIbc/2yBEMb7F+ljDldjDmR8Y6+UvTReRoO4lhvYgppH8E2Yo6g+UtS3710u5wqUwl0B5CZmT0j4FbQCMJp4KuscI6zFbuipVw8I10kXv6G/xaIWt/ZdIJRpFo9NVsDreUEeZoi6aRg2YisdzGFcJawy3OKgRh9WyZ7R+lPdvtTAqOnX6m6CS2I4LM3+xuTegiOEPzMCYY7UGx8nKNPQXzBEtGAegfQMwMP+MUQ==',
    key_id   => 'paul.belanger@polybeacon.com',
    uid      => 2010,
    gid      => 2010,
  }

  @user::virtual::localuser { 'mkiss':
    realname => 'Marton Kiss',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCb5qdaiKaRqBRgLW8Df+zD3C4a+gO/GFZYEDEd5nvk+LDGPuzi6s639DLqdfx6yvJ1sxxNUOOYhE/T7raDeS8m8fjk0hdVzARXraYDbckt6AELl7B16ZM4aEzjAPoSByizmfwIVkO1zP6kghyumV1kr5Nqx0hTd5/thIzgwdaGBY4I+5iqcWncuLyBCs34oTh/S+QFzjmMgoT86PrdLSsBIINx/4rb2Br2Sb6pRHmzbU+3evnytdlDFwDUPfdzoCaQEdXtjISC0xBdmnjEvHJYgmSkWMZGgRgomrA06Al9M9+2PR7x+burLVVsZf9keRoC7RYLAcryRbGMExC17skL',
    key_id   => 'marton.kiss@gmail.com',
    uid      => 2011,
    gid      => 2011,
  }

  @user::virtual::localuser { 'smarcet':
    realname => 'Sebastian Marcet',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDP5ce0Ywtbgi3LGMZWA5Zlv/EQ07F/gWnZOMN6TRfiCiiBNyf8ARtKgmYSINS8W537HJYBt3qTfa5xkZmpBrtE6x8OTfR5y1L+x/PrLTUkQhVDY19EixD9wDIrQIIjo2ZVq+zErXBRQuGmJ3Hl+OGw+wtvGS8f768kMnwhKUgyITjWV2tKr/q88J8mBOep48XUcRhidDWsOjgIDJQeY2lbsx1bbZ7necrJS17PHqxhUbWntyR/VKKbBbrNmf2bhtTRUSYoJuqabyGDTZ0J25A88Qt2IKELy6jsVTxHj9Y5D8oH57uB7GaNsNiU+CaOcVfwOenES9mcWOr1t5zNOdrp',
    key_id   => 'smarcet@gmail.com',
    uid      => 2012,
    gid      => 2012,
  }

  @user::virtual::localuser { 'zaro':
    realname => 'Khai Do',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDJqB//ilMx7Y1tKzviAn/6yeXSRAi2VnaGN0/bfaa5Gciz+SWt8vAEAUE99fzuqeJ/ezjkuIXDFm/sjZr93y567a6sDT6CuhVUac1FZIhXRTs0J+pBOiENbwQ7RZxbkyNHQ0ndvtz3kBA1DF5D+MDkluBlIWb085Z31rFJmetsB2Zb8s1FKUjHVk/skyeKSj0qAK5KN3Wme6peWhYjwBiM0gUlxIsEZM6JLYdoPIbD5B8GYAktMN2FvJU9LgKGL93jLZ/vnMtoQIHHAG/85NdPURL1Zbi92Xlxbm4LkbcHnruBdmtPfSgaEupwJ+zFmK264OHD7QFt10ztPMbAFCFn',
    key_id   => 'khaido@khaido-HP-EliteBook-Folio-9470m',
    uid      => 2013,
    gid      => 2013,
  }

  @user::virtual::localuser { 'slukjanov':
    realname => 'Sergey Lukjanov',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHGuIVB/WxBd7k1R8x2FyfqT6KxRnoM7lE5RE8gvBk2r8cQeH5k1c+P5JrBvWpmqXv4satoivYOBiIb7JXEgIxx62YUx/JQ0J7k3w+av6h4iFe2OhOtEOjMF5F8/wO8a/95OeTZPzBZlUfA3hx754kuw3Q/aBKQUOHWxJOIedGyVHeJc7XiFj3RXIufFuUfng9+p4Z3q6d2/WpuKqs00WI0CLF17PkU4i8P9CraJR1dmsWW6zoxMT2G+DwMFI7ZMS3xrVBRuLwrLlbylVLW2kOJ0JeyjHnRh7X1kR7KG3cGOOjA1YQ0e+mXvremcO3/3o6Iop/N1AtqVuYCKlZc7Y9',
    key_id   => 'slukjanov@mirantis.com',
    uid      => 2014,
    gid      => 2014,
  }

  @user::virtual::localuser { 'elizabeth':
    realname => 'Elizabeth K. Joseph',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDL9x1rhTVOEQEanrN+ecycaDtAbbh3kr41Rxx7galtLq0JwftjsZqv2Vwl9c8ARmm8HiHcLwDoaZB9gvs6teMScCB+5a1fcohiycJBl2olNFRzkGapDaTvl74aLXQBWaV84D8tUavEl26zcgwrv9WLUsy9pnHoo5K0BzbK7vT2g3VictCphveC2vdjCDeptocWvt4zxCmAY6O7QMKeUjKMlvuy+zCohJcR4BbDnw8EriFAmCeQZcAgfLTyeAvjo384NNIFWyhCwvbCLvpgTplMCp896DWLlXu9eaGUCNjT/sZM8zafAXbfc6OKYFQ5iANAiJktWwKaUaphJkbSVWT5',
    key_id   => 'elizabeth@r2d2',
    uid      => 2015,
    gid      => 2015,
  }

}
