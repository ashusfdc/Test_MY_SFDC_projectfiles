trigger preLead on Lead (before insert, before update) {
    for(Lead le: Trigger.new){
        system.debug('Trigger.New'+ Trigger.new);
        le.FirstName = 'Dr.'+le.FirstName;
        system.debug('Trigger.New'+ Trigger.new);
    }

}