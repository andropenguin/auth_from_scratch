# The revised sample of Authentication from Scratch

## Introduction
There is a sample of authentication from scratch is at [#250 Authentication from Scratch](http://railscasts.com/episodes/250-authentication-from-scratch?language=en&view=asciicast). That sample does not work in version 3.2 of Ruby on Rails. The reason is as follows. In the sample, attr_accessor is used for password, however attr_accessor should not be used in Rails 3.2 for security. In Rails 3.2, attr_accessible should be used, however attr_accessible attribute should be the column of the database table. The password should not be saved in the database, so the password attribute cannot have attr_acceissible. So I revised the sample of Authentication from Scratch.

## The points of the revision of sample.
* attr_accessible is not used for password and password_confirmation. The accessors of these attributes are defined in the revised sample.
* Only the email attribute is used in the generation of the class User when sign_uping. The values of the password and password_confirmation which are input in the sign_up form are set in the controller, UsesrController, so these values are not saved in the database.
