public class EMEX_EmailService {
    
	public static void sendSingleEMailUsingEmailStrings(List<String> emails, String subject, String body  ){
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        email.setToAddresses(emails);
        email.setSubject(subject);
        email.setPlainTextBody(body);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
    }
    
    public static void sendSingleEMailUsingTargetObjectId(ID objectId, String subject, String body  ){
        
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        
        email.setTargetObjectId(objectId);
        email.setSubject(subject);
        email.setPlainTextBody(body);
	    
	String myIdPrefix = String.valueOf(objectId).substring(0,3);
        if(myIdPrefix == '005') email.setSaveAsActivity(false);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        
    }
	
    public static void sendMassEMailUsingTargetObjectId(List<ID> objectIds){
    
	Messaging.MassEmailMessage email = new Messaging.MassEmailMessage();

	EmailTemplate template =  [SELECT Id 
				   FROM EmailTemplate 
				   WHERE DeveloperName = 'EMEX_Email_Template_For_Contact'
				   LIMIT 1];

	email.setTargetObjectIds(objectIds);
	email.setTemplateID(template.Id);

	Messaging.sendEmail(new Messaging.MassEmailMessage[] { email });
    }

}
