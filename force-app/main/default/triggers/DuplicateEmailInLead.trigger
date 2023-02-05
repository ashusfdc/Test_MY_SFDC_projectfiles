trigger DuplicateEmailInLead on Lead (before insert,before update) {
    
    map<String,Contact> mapOfContact = new map<String,Contact>();
	List<Contact> con = [select id,email from contact];
    for(Contact c:con){
        mapOfContact.put(c.Email,c);
    }
    for(Lead l:trigger.new){
        if(l.email!=null && (trigger.isInsert || l.email!=trigger.oldMap.get(l.id).email)){
            if(mapOfContact.containsKey(l.email)){
                l.email.addError('Email already exist');
            }
        }
    }
}