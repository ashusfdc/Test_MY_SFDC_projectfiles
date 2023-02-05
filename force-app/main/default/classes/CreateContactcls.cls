public class CreateContactcls {
    @Auraenabled
    public static string createContact(Contact contObj){
        System.debug('contact::'+contObj.firstName);
        insert contObj;
        return contObj.Id;
    }

}