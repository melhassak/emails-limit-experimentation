/*********** Start Internal User Creation ***********/
Profile profileId = [SELECT Id 
                     FROM Profile 
                     WHERE Name = 'Standard User' 
                     LIMIT 1];

User usr = new User(
        LastName = 'EMEX TEST',
        FirstName='INTERNAL USER',
        Alias = 'emexint',
        Email = 'EMEX_InternalUser@YOPmail.com',
        Username = 'EMEX_InternalUser@YOPmail.com',
        ProfileId = profileId.id,
        TimeZoneSidKey = 'GMT',
        LanguageLocaleKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LocaleSidKey = 'en_US'
        );

Insert usr;
System.debug('Id = ' + usr.id);
/*********** End Internal User Creation ***********/

/*********** Start Contact Creation ***********/
Contact con = new Contact(
    FirstName='CONTACT',
    LastName='EMEX TEST',
    Phone='415.555.1212',
    Email= 'EMEX_Contact@YOPmail.com');

 Insert con;
system.debug('Id = ' + con.Id);
/*********** End Contact Creation ***********/

/*********** Start External User Creation ***********/
//Create Business Account        
Account act = new Account(
         Name = 'EMEX TEST ACCOUNT',
         OwnerId = UserInfo.getUserId()
);
Insert act;

//Create Contact
Contact con = new Contact(
    FirstName='EXTERNAL USER',
    LastName='EMEX TEST',
    Phone='415.555.2424',
    Email= 'EMEX_ExternalUser@YOPmail.com',
    AccountId = act.Id);

Insert con;

//Create User
Profile profileId = [SELECT Id 
                     FROM Profile 
                     WHERE Name = 'EMEX Customer Community User' 
                     LIMIT 1];

User usr = new User(
        LastName = 'EMEX TEST',
        FirstName='EXTERNAL USER',
        Alias = 'emexext',
        Email = con.Email,
        Username = con.Email,
        ProfileId = profileId.id,
        ContactId = con.Id,
        CommunityNickname = 'emexext',
        TimeZoneSidKey = 'GMT',
        LanguageLocaleKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LocaleSidKey = 'en_US'
        );

Insert usr;
System.debug('Id = ' + usr.id);
/*********** End External User Creation ***********/