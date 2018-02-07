# archdaily_task
Archdaily task




1) Clone Project

2) bundle install

3) sudo gem install json
   sudo gem install rspec
   sudo gem install pry


4) Ejecutar el proyecto en la consola: ruby main.rb
te

Selecciona una opción:
	  1: Scenario 1
	  2: Scenario 2
	  3: Scenario 3
	  4: Scenario 4
	  5: Agregar un nuevo scenario (json)
	  6: Pruebas automáticas (rspec)
	  7: Salir"

_________________________________________________________________________

The Context

Every article is identified by a token (for example 246311). For every article we have a JSON file that contains many recommendations for that article, based on 3 different algorithms: logs, content, and myad

The logs algorithm finds articles visited by users that also visited the current article.
The content algorithm finds articles that contains similar text to the current article.
The myad algorithm finds articles that have been bookmarked within the same folder that the current article.
The Problem

We want to show 4 recommended articles for a particular article. As you could imagine, sometimes we don't have recommendations for all the 3 algorithms, and we have just for logs and myad, for example. Sometimes we have only 1 recommendation for a particular algorithm and 7 recommendations for another algorithm.

We need to get an Array(4) with the most homegenous list of recommendations, based in a Round-Robin approach. It means, if we have the following scenarios:

Scenarios

Scenario 1

JSON file:

{
  "logs": [
    {
      "url": "//www.archdaily.com/345048/nirma-vidyavihar-apurva-amin-architects",
      "token": "345048",
      "thumbnail": "//images.adsttc.com/media/images/5143/8a8e/b3fc/4baa/2c00/000e/small_jpg/NVV1_AAA_09.jpg?1363380874",
      "title": "Nirma Vidyavihar / Apurva Amin Architects"
    }
  ],
  "content": [],
  "myad": [
  ]
}
Expected result: [345048]

Scenario 2

JSON file

{
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    },
    {
      "url": "//www.archdaily.com/562873/piet-and-sarah-copper-extension-atelier-vens-vanbelle",
      "token": "562873",
      "thumbnail": "//images.adsttc.com/media/images/5451/8a23/e58e/ce4c/0800/0017/small_jpg/MPN116.jpg?1414629900",
      "title": "Piet & Sarah - Copper Extension / Atelier Vens Vanbelle"
    },
    {
      "url": "//www.archdaily.com/385093/centre-village-5468796-architecture",
      "token": "385093",
      "thumbnail": "//images.adsttc.com/media/images/51b3/aec2/b3fc/4b28/0700/00ae/small_jpg/Centre_Village_JB_06.jpg?1370730138",
      "title": "Centre Village  / 5468796 Architecture + Cohlmeyer Architecture Limited"
    },
    {
      "url": "//www.archdaily.com/803992/recreational-community-center-chatelaine-nil-balexert-stendardo-menningen-architectes",
      "token": "803992",
      "thumbnail": "//images.adsttc.com/media/images/5886/8325/e58e/ce62/cc00/0054/small_jpg/161222_STM_41.jpg?1485210392",
      "title": "Recreational Community Center Ch\u00e2telaine \u2013 Balexert  / STENDARDO MENNINGEN ARCHITECTES"
    }
  ],
  "myad": [
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    },
    {
      "url": "//www.archdaily.com/769163/housing-in-auvry-barbusse-tectone",
      "token": "769163",
      "thumbnail": "//images.adsttc.com/media/images/558b/6de4/e58e/ce41/0700/01ce/small_jpg/portada_CDM_-_234.jpg?1435200988",
      "title": "Housing in Auvry Barbusse / Tect\u00f4ne"
    },
    {
      "url": "//www.archdaily.com/789357/escherpark-e2a",
      "token": "789357",
      "thumbnail": "//images.adsttc.com/media/images/575d/c7c3/e58e/ceb2/ac00/0148/small_jpg/E2A_Escherpark-1_RasmusNorlander.jpg?1465763767",
      "title": "Escherpark / E2A"
    }
  ]
}
Expected Result: [790952, 103678, 788138, 802358]

Scenario 3:

JSON File:

{
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    }
  ],
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "myad": [
  ]
}
Expected Result: [103678, 790952, 802358, 788138]

Scenario 4:

JSON file:

{
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "70 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    },
    {
      "url": "//www.archdaily.com/562873/piet-and-sarah-copper-extension-atelier-vens-vanbelle",
      "token": "562873",
      "thumbnail": "//images.adsttc.com/media/images/5451/8a23/e58e/ce4c/0800/0017/small_jpg/MPN116.jpg?1414629900",
      "title": "Piet & Sarah - Copper Extension / Atelier Vens Vanbelle"
    },
    {
      "url": "//www.archdaily.com/385093/centre-village-5468796-architecture",
      "token": "385093",
      "thumbnail": "//images.adsttc.com/media/images/51b3/aec2/b3fc/4b28/0700/00ae/small_jpg/Centre_Village_JB_06.jpg?1370730138",
      "title": "Centre Village  / 5468796 Architecture + Cohlmeyer Architecture Limited"
    },
    {
      "url": "//www.archdaily.com/803992/recreational-community-center-chatelaine-nil-balexert-stendardo-menningen-architectes",
      "token": "803992",
      "thumbnail": "//images.adsttc.com/media/images/5886/8325/e58e/ce62/cc00/0054/small_jpg/161222_STM_41.jpg?1485210392",
      "title": "Recreational Community Center Ch\u00e2telaine \u2013 Balexert  / STENDARDO MENNINGEN ARCHITECTES"
    }
  ],
  "myad": [
  ]
}
Expected result: [790952, 103678, 802358, 562873]

The task

Build a (ruby) library that builds this required array and an (rspec) test that tests all the 4 scenarios described before.The Context

Every article is identified by a token (for example 246311). For every article we have a JSON file that contains many recommendations for that article, based on 3 different algorithms: logs, content, and myad

The logs algorithm finds articles visited by users that also visited the current article.
The content algorithm finds articles that contains similar text to the current article.
The myad algorithm finds articles that have been bookmarked within the same folder that the current article.
The Problem

We want to show 4 recommended articles for a particular article. As you could imagine, sometimes we don't have recommendations for all the 3 algorithms, and we have just for logs and myad, for example. Sometimes we have only 1 recommendation for a particular algorithm and 7 recommendations for another algorithm.

We need to get an Array(4) with the most homegenous list of recommendations, based in a Round-Robin approach. It means, if we have the following scenarios:

Scenarios

Scenario 1

JSON file:

{
  "logs": [
    {
      "url": "//www.archdaily.com/345048/nirma-vidyavihar-apurva-amin-architects",
      "token": "345048",
      "thumbnail": "//images.adsttc.com/media/images/5143/8a8e/b3fc/4baa/2c00/000e/small_jpg/NVV1_AAA_09.jpg?1363380874",
      "title": "Nirma Vidyavihar / Apurva Amin Architects"
    }
  ],
  "content": [],
  "myad": [
  ]
}
Expected result: [345048]

Scenario 2

JSON file

{
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    },
    {
      "url": "//www.archdaily.com/562873/piet-and-sarah-copper-extension-atelier-vens-vanbelle",
      "token": "562873",
      "thumbnail": "//images.adsttc.com/media/images/5451/8a23/e58e/ce4c/0800/0017/small_jpg/MPN116.jpg?1414629900",
      "title": "Piet & Sarah - Copper Extension / Atelier Vens Vanbelle"
    },
    {
      "url": "//www.archdaily.com/385093/centre-village-5468796-architecture",
      "token": "385093",
      "thumbnail": "//images.adsttc.com/media/images/51b3/aec2/b3fc/4b28/0700/00ae/small_jpg/Centre_Village_JB_06.jpg?1370730138",
      "title": "Centre Village  / 5468796 Architecture + Cohlmeyer Architecture Limited"
    },
    {
      "url": "//www.archdaily.com/803992/recreational-community-center-chatelaine-nil-balexert-stendardo-menningen-architectes",
      "token": "803992",
      "thumbnail": "//images.adsttc.com/media/images/5886/8325/e58e/ce62/cc00/0054/small_jpg/161222_STM_41.jpg?1485210392",
      "title": "Recreational Community Center Ch\u00e2telaine \u2013 Balexert  / STENDARDO MENNINGEN ARCHITECTES"
    }
  ],
  "myad": [
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    },
    {
      "url": "//www.archdaily.com/769163/housing-in-auvry-barbusse-tectone",
      "token": "769163",
      "thumbnail": "//images.adsttc.com/media/images/558b/6de4/e58e/ce41/0700/01ce/small_jpg/portada_CDM_-_234.jpg?1435200988",
      "title": "Housing in Auvry Barbusse / Tect\u00f4ne"
    },
    {
      "url": "//www.archdaily.com/789357/escherpark-e2a",
      "token": "789357",
      "thumbnail": "//images.adsttc.com/media/images/575d/c7c3/e58e/ceb2/ac00/0148/small_jpg/E2A_Escherpark-1_RasmusNorlander.jpg?1465763767",
      "title": "Escherpark / E2A"
    }
  ]
}
Expected Result: [790952, 103678, 788138, 802358]

Scenario 3:

JSON File:

{
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    }
  ],
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "60 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "myad": [
  ]
}
Expected Result: [103678, 790952, 802358, 788138]

Scenario 4:

JSON file:

{
  "logs": [
    {
      "url": "//www.archdaily.com/790952/vigneux-sur-seine-housing-margot-duclot-architectes-associes",
      "token": "790952",
      "thumbnail": "//images.adsttc.com/media/images/577e/4943/e58e/cea4/f500/0149/small_jpg/MDAA_VIGNEUX_HD-4%C2%A911h45.jpg?1467894052",
      "title": "Vigneux-Sur-Seine Housing / Margot-Duclot architectes associ\u00e9s"
    },
    {
      "url": "//www.archdaily.com/802358/modular-house-dubldom-bio-architects",
      "token": "802358",
      "thumbnail": "//images.adsttc.com/media/images/5861/e0b7/e58e/ce50/7900/029c/small_jpg/interior-01.jpg?1482809510",
      "title": "Modular House DublDom / BIO-architects"
    },
    {
      "url": "//www.archdaily.com/788138/60-social-housing-apartments-in-rive-de-gier-tectoniques-architects",
      "token": "788138",
      "thumbnail": "//images.adsttc.com/media/images/5743/f056/e58e/ce1e/dd00/00d9/small_jpg/RIVE_DE_GIER_1S2-5.jpg?1464070176",
      "title": "70 Social Housing Apartments in Rive-De-Gier  / Tectoniques Architects"
    }
  ],
  "content": [
    {
      "url": "//www.archdaily.com/103678/riva-del-garda-hospital-atenastudio",
      "token": "103678",
      "thumbnail": "//images.adsttc.com/media/images/55f6/f706/adbc/0139/a000/02ed/small_jpg/4-325.jpg?1442248427",
      "title": "Re-Development of the Former Hospital/ the New Housing City / ATENASTUDIO + 3TI PROGETTI ITALIA + KREJ ENGINEERING"
    },
    {
      "url": "//www.archdaily.com/562873/piet-and-sarah-copper-extension-atelier-vens-vanbelle",
      "token": "562873",
      "thumbnail": "//images.adsttc.com/media/images/5451/8a23/e58e/ce4c/0800/0017/small_jpg/MPN116.jpg?1414629900",
      "title": "Piet & Sarah - Copper Extension / Atelier Vens Vanbelle"
    },
    {
      "url": "//www.archdaily.com/385093/centre-village-5468796-architecture",
      "token": "385093",
      "thumbnail": "//images.adsttc.com/media/images/51b3/aec2/b3fc/4b28/0700/00ae/small_jpg/Centre_Village_JB_06.jpg?1370730138",
      "title": "Centre Village  / 5468796 Architecture + Cohlmeyer Architecture Limited"
    },
    {
      "url": "//www.archdaily.com/803992/recreational-community-center-chatelaine-nil-balexert-stendardo-menningen-architectes",
      "token": "803992",
      "thumbnail": "//images.adsttc.com/media/images/5886/8325/e58e/ce62/cc00/0054/small_jpg/161222_STM_41.jpg?1485210392",
      "title": "Recreational Community Center Ch\u00e2telaine \u2013 Balexert  / STENDARDO MENNINGEN ARCHITECTES"
    }
  ],
  "myad": [
  ]
}
Expected result: [790952, 103678, 802358, 562873]

The task

Build a (ruby) library that builds this required array and an (rspec) test that tests all the 4 scenarios described before.
