/*********** Send Email Using Email Address as a Text ***********/
List<String> emails = new List<String>();
emails.add('elhassak.m@gmail.com');
String subject = 'Subject: titi';
String body = 'Body: titi';

EMEX_EmailService.sendSingleEMailUsingEmailStrings(
    emails,
    subject,
    body    
);
/*****************************************************************/

/***************** Send Email Using Target Object Id *************/
Id objectId = '0038d0000068ox7AAA';
String subject = 'Subject: titi';
String body = 'Body: titi';

EMEX_EmailService.sendSingleEMailUsingTargetObjectId(
    objectId,
    subject,
    body    
);
/*****************************************************************/

/***************** Send Mass Email Using Target Object Id ********/
List<ID> objectIds = new List<ID>();

objectIds.add('0038d0000068pj2AAA');
objectIds.add('0038d0000068plNAAQ');

EMEX_EmailService.sendMassEMailUsingTargetObjectId(objectIds);
/*****************************************************************/
