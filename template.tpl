___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Data Variable",
  "description": "Use this variable for retrieving data from the Data tag store.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "name",
    "displayName": "Name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Put here the name of the stored parameter you want to retrieve. For example: email_address"
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const localStorage = require('localStorage');
const getCookieValues = require('getCookieValues');
const JSON = require('JSON');

if (localStorage) {
  const stape = localStorage.getItem('stape');
  if (stape) {
    const stapeParsed = JSON.parse(stape);

    if (stapeParsed[data.name]) {
      return stapeParsed[data.name];
    }
  }
}

const stapeCookieValue = getCookieValues('stape');

if (stapeCookieValue && stapeCookieValue[0]) {
  const stapeParsedCookie = JSON.parse(stapeCookieValue[0]);

  if (stapeParsedCookie[data.name]) {
    return stapeParsedCookie[data.name];
  }
}


return getCookieValues('stape_'+data.name)[0];


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_local_storage",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "stape"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 08/07/2021, 18:43:37


