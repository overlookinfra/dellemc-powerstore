require 'puppet/resource_api'

Puppet::ResourceApi.register_type(
  name: 'powerstore_local_user',
  desc: <<-EOS,
    
  EOS
  attributes:   {
    ensure:      {
      type: 'Enum[present, absent]',
      desc: 'Whether this apt key should be present or absent on the target system.'
    },

    body:          {
      type:      'Hash',
      desc:      "",
      behaviour: :parameter,
    },
    current_password:          {
      type:      'Optional[String]',
      desc:      "Current password of the local user. Any local user can change his own password by providing current_password along with the new password.",
      behaviour: :init_only,
    },
    id:          {
      type:      'String',
      desc:      "Unique identifier of the local user account to be deleted.",
      behaviour: :parameter,
    },
    is_locked:          {
      type:      'Optional[Boolean]',
      desc:      "Lock or unlock the local user account. Local user with administration/security administration role can lock or unlock any other local user account. You cannot lock an account you are currently logged-in to.",
      behaviour: :init_only,
    },
    name:          {
      type:      'Optional[String]',
      desc:      "Name of the new local user account to be created. The name value can be 1 to 64 UTF-8 characters long, and may only use alphanumeric characters. Dot(.) is the only special character allowed.",
      behaviour: :init_only,
    },
    password:          {
      type:      'Optional[String]',
      desc:      "Password for the new local user account to be created. The password value can be 8 to 40 UTF-8 characters long, and include as a minimum one uppercase character, one lowercase character, one numeric character, and one special character from this list  [!,@#$%^*>_~].",
      behaviour: :init_only,
    },
    role_id:          {
      type:      'Optional[String]',
      desc:      "The unique identifier of the role to which the new local user will be mapped. Where role_id '1' is for Administrator, '2' is for Storage Administrator, '3' is for Operator, '4' is for VM Administrator and '5' is for Security Administrator roles.",
      behaviour: :init_only,
    }, 
  },
  autorequires: {
    file:    '$source', # will evaluate to the value of the `source` attribute
    package: 'apt'
  },
)