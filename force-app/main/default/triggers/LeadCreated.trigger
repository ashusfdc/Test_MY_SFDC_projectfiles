trigger LeadCreated on Lead (before insert) {
    
    for(Lead le:Trigger.new){
        if(le.LeadSource=='Web')
            le.Rating='Cold';
        else
            le.Rating='Hot';
    }

}