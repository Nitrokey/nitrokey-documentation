.. highlight:: none

Tags & Roles
---------------

Tags can be used to put access restrictions on specific keys. For example: 


User *JaneUser*::

	{
	  "realName": "Jane User",
	  "role": "Operator"
	  "tags": [ "berlin" , "frankfurt" ]
	}



Key *mykey*::

		{
	  "mechanisms": [
	    "RSA_Signature_PSS_SHA256"
	  ],
	  "restrictions": {
	      "userTag": "berlin"
	  }
	  "type": "RSA",
	  "key": {
	    "modulus": "FhJQl11CiY0ifRHXeAqFh4rdSl6",
	    "publicExponent": "FhJQl11CiY0ifRHXeAqFh4rdSl6"
	  },
	  "operations": 242
	}


Tags are managed by Administrator users:

- Keys can be subject to a restriction list: a set of tags in which one of them need to be matched for the key to be used.
- Operator users get assigned a set of tags enabling them the use of the corresponding keys. It can be read but not modified by the user.
- Restrictions are validated when using a key, in which case the defined usertag has to match one of the calling user's tags.
- Only administators can set tags in user profiles.
- Tags are simple strings and all administators can set tags without restrictions.
- Every operator can see all keys, also those with foreign tags (but they can't use it).
- Tags are optional.
- (In the future, restrictions could be extended with more condition types, e.g allowed time frame.)

Roles
^^^^^

Each user account configured on the NetHSM has one of the following Roles
assigned to it. Following is a high-level description of the operations allowed
by individual Roles, for endpoint-specific details please refer to the REST API
documentation.

**R-Administrator**     A user account with this Role has access to all operations
provided by the REST API, with the exception of “key usage” operations,
i.e. message signing and decryption.

**R-Operator**  A user account with this Role has access to all “key usage” operations, a read-only subset of “key management” operations and “user
management” operations allowing changes to their own account only.

**R-Metrics**   A user account with this Role has access to read-only metrics
operations only.

**R-Backup**    A user account with this Role has access to the operations required
to initiate a system backup only.
