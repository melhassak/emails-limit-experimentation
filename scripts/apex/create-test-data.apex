/*********** Start Internal User Creation ***********/
Profile profileId1 = [SELECT Id 
                     FROM Profile 
                     WHERE Name = 'Standard User' 
                     LIMIT 1];

String uniqueName1 = '0' + Integer.valueOf(math.rint(math.random()*1000000));

User usr1 = new User(
        LastName = 'EMEX TEST',
        FirstName='INTERNAL USER',
        Alias = 'emexint',
        Email = 'EMEX_InternalUser@YOPmail.com',
        Username = 'EMEX_InternalUser' + uniqueName1 + '@YOPmail.com',
        ProfileId = profileId1.id,
        TimeZoneSidKey = 'GMT',
        LanguageLocaleKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LocaleSidKey = 'en_US'
        );

Insert usr1;
System.debug('Id = ' + usr1.id);
/*********** End Internal User Creation ***********/

/*********** Start Contact Creation ***********/
Contact con1 = new Contact(
    FirstName='CONTACT',
    LastName='EMEX TEST',
    Phone='415.555.1212',
    Email= 'EMEX_Contact@YOPmail.com');

 Insert con1;
system.debug('Id = ' + con1.Id);
/*********** End Contact Creation ***********/

/*********** Start External User Creation ***********/
//Create Business Account        
Account act = new Account(
         Name = 'EMEX TEST ACCOUNT',
         OwnerId = UserInfo.getUserId()
);
Insert act;

//Create Contact
Contact con2 = new Contact(
    FirstName='EXTERNAL USER',
    LastName='EMEX TEST',
    Phone='415.555.2424',
    Email= 'EMEX_ExternalUser@YOPmail.com',
    AccountId = act.Id);

Insert con2;

//Create User
Profile profileId2 = [SELECT Id 
                     FROM Profile 
                     WHERE Name = 'EMEX Customer Community User' 
                     LIMIT 1];

String uniqueName2 = '0' + Integer.valueOf(math.rint(math.random()*1000000));

User usr2 = new User(
        LastName = 'EMEX TEST',
        FirstName='EXTERNAL USER',
        Alias = 'emexext',
        Email = con2.Email,
        Username = 'EMEX_ExternalUser' + uniqueName2 + '@YOPmail.com',
        ProfileId = profileId2.id,
        ContactId = con2.Id,
        CommunityNickname = 'emexext',
        TimeZoneSidKey = 'GMT',
        LanguageLocaleKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LocaleSidKey = 'en_US'
        );

Insert usr2;
System.debug('Id = ' + usr2.id);
/*********** End External User Creation ***********/
