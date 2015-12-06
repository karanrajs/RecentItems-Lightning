@isTest
public class RecentRecordsControllerTest {
    public static testmethod void myTestController(){
       Test.startTest();
       Case act = new Case();
       act.Status = 'New';
       act.Origin = 'Phone';
       act.Subject = 'Testing';
       insert act;
       List<Case> recentRecords = RecentRecordsController.getRecentRecords('Case','10','Id,Origin');
       system.assertEquals(true, recentRecords.size()<10); 
       system.assertEquals(act.Origin = 'Phone', recentRecords[0].Origin);
       Test.stopTest();
    }
}