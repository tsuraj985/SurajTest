@isTest
public with sharing class CA_InsystonCalculatorController_Test {
    
    static testMethod void Test_cal_controller (){
    	
    	String Input_Json_String = '"{\"Region\":61,\"TaxRate\":10.0,\"StartDate\":\"2016-12-11T14:05:34\",\"TermInMonths\":24,\"PaymentFrequency\":6,\"Instalment\":1,\"FinanceType\":4,\"FinancierCompondingFrequency\":6,\"FinancierCostOfFunds\":7.0,\"FinancierMargin\":3.0,\"GSTRepaymentOnPaymentX\":null,\"FinancedAssetCostNetAmount\":19998.0,\"DisclosedFeesFinancedNetAmount\":2.0,\"UndisclosedFeesFinancedNetAmount\":2.0,\"CommissionNetAmount\":3.0,\"SubventionAmount\":4.0,\"DepositAmount\":2.0,\"TradeInAmount\":2.0,\"ResidualNetAmount\":4.0,\"PaymentSchedule\": [{\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}, {\"PaymentMultiplier\":1.0,\"NetPaymentAmount\":0.0}]}"';
    	CA_InsystonCalculatorController.getCalculatedResponse(Input_Json_String);
    }

	static testMethod void Insyston_Test() {

		Account account = new Account();
		account.Name = 'Test Account';
		account.put('BillingStreet', 'Test Street');
		account.put('BillingCity', 'Test City');
		account.put('BillingState', 'Test State');
		account.put('BillingPostalCode', '12345');
		account.put('BillingCountry', 'USA');
		insert account;

		Contact contact = new Contact();
		contact.LastName = 'Test Contact';
		contact.put('MailingStreet', 'Test Street');
		contact.put('MailingCity', 'Test City');
		contact.put('MailingState', 'Test State');
		contact.put('MailingPostalCode', '12345');
		contact.put('MailingCountry', 'USA');
		contact.put('MobilePhone','12346567890');
		insert contact;

		Opportunity opportunity = new Opportunity();
		opportunity.Name = 'Test Opportunity';
		opportunity.StageName = 'Closed Won';
		opportunity.CloseDate = Date.today();
		insert opportunity;


		/**
		Cover
		String getRecordTypeId(String RecordTypeName)
		Method
		**/
		String recordTypeIdDiy = CA_InsystonCalculatorController.getRecordTypeId('DIY');
		String recordTypeIdQuick = CA_InsystonCalculatorController.getRecordTypeId('Quick Option');


		/**
		Cover
		List<Eqp3__EquipmentCalculatorResult__c> saveQuickOptionResult(List<Eqp3__EquipmentCalculatorResult__c> quickObjList, String recordType)
		Method
		**/
		List<Eqp3__EquipmentCalculatorResult__c> equipmentCalculatorResults = new List<Eqp3__EquipmentCalculatorResult__c>();
		Eqp3__EquipmentCalculatorResult__c result = new Eqp3__EquipmentCalculatorResult__c();
		result.Eqp3__ChattelMortgageCommercialHirePurchase__c = 20000;
		result.Eqp3__FinanceLeaseOperatingLease__c = 20000;
		result.Eqp3__GrossPayment__c = 20000;
		result.Eqp3__GSTRepayment__c = 1;
		result.Eqp3__Multiplier__c = 1;
		result.Eqp3__NetPayment__c = 20000;
		result.Eqp3__PaymentDate__c = Date.today();
		result.Eqp3__PaymentNumber__c = 1;
		result.Eqp3__TaxPayment__c = 20000;
		result.Eqp3__TermsInMonths__c = '36 Months';
		equipmentCalculatorResults.add(result);

		List<Eqp3__EquipmentCalculatorResult__c> returnedResultsList = CA_InsystonCalculatorController.saveQuickOptionResult(equipmentCalculatorResults, recordTypeIdDiy);


		/**
		Cover
		Eqp3__EquipmentCalculatorSetting__c saveQuickOptionInput(Eqp3__EquipmentCalculatorSetting__c quickObj)
		Method
		**/

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = 'Operating Lease',
				Eqp3__Frequency__c = 'Monthly',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = 'Arrears',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = 'Monthly',
				Eqp3__Region__c = 'Australia',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);

		//Eqp3__EquipmentCalculatorSetting__c returnedSettings = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting);
		insert equipmentCalculatorSetting;

		result.Eqp3__EquipmentCalculatorSetting__c = equipmentCalculatorSetting.Id;
		update result;

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting1 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '1',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '1',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings1 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting1);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting2 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = null,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = null,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '2',
				Eqp3__Frequency__c = '2',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '2',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = null,
				Eqp3__Rate_Frequency_Net__c = '2',
				Eqp3__Region__c = '64',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings2 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting2);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting3 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '3',
				Eqp3__Frequency__c = '3',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '3',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings3 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting3);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting4 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '4',
				Eqp3__Frequency__c = '4',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '4',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings4 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting4);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting5 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '5',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '5',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings5 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting5);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting6 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '6',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '6',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings6 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting6);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting7 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '7',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '7',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings7 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting7);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting8 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '8',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '8',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings8 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting8);

		Eqp3__EquipmentCalculatorSetting__c equipmentCalculatorSetting9 = new Eqp3__EquipmentCalculatorSetting__c(
				Eqp3__Account__c = account.Id,
				Eqp3__commission_Net__c = 2000,
				Eqp3__contact__c = contact.Id,
				Eqp3__cost_Of_Funds__c = 2000,
				Eqp3__Deposit__c = 2000,
				Eqp3__Disclosed_Fees_Net__c = 2000,
				Eqp3__Financed_Asset_Net__c = 200000,
				Eqp3__Finance_Type__c = '1',
				Eqp3__Frequency__c = '9',
				Eqp3__GST_Repayment_On__c = 1,
				Eqp3__Instalment__c = '1',
				Eqp3__Margin__c = 12,
				Eqp3__Opportunity__c = opportunity.Id,
				Eqp3__Rate_Frequency_Net__c = '9',
				Eqp3__Region__c = '61',
				Eqp3__Residual_Net__c = 2000,
				Eqp3__Scenario_Name__c = 'Test Scenerio',
				Eqp3__Settings_Type__c = 'DIY',
				Eqp3__Start_Date__c = Date.today(),
				Eqp3__Subvention__c = 2000,
				Eqp3__Tax_Rate__c = 10,
				Eqp3__Term_In_Months__c = '36',
				Eqp3__Trade_In__c = 2000,
				Eqp3__Undisclosed_Fees_Net__c = 2000
		);
		Eqp3__EquipmentCalculatorSetting__c returnedSettings9 = CA_InsystonCalculatorController.saveQuickOptionInput(equipmentCalculatorSetting9);



		/**
		Cover
		List<Eqp3__EquipmentCalculatorSetting__c> searchExistingEquipCalSettings(String accId, String conId, String oppId, String recId)
		Method
		**/

		List<EquipmentCalculatorSetting__c> equipmentCalculatorSettingsReturned = CA_InsystonCalculatorController.searchExistingEquipCalSettings(account.Id, contact.Id, opportunity.Id, recordTypeIdDiy);

		/**
		Cover
		List<Eqp3__EquipmentCalculatorSetting__c> deleteExistingEquipCalSettings(String objId, String accId, String conId, String oppId, String recId)
		Method
		**/

		List<EquipmentCalculatorSetting__c> equipmentCalculatorSettingsDeleteReturned = CA_InsystonCalculatorController.deleteExistingEquipCalSettings(equipmentCalculatorSetting.Id, account.Id, contact.Id, opportunity.Id, 'DIY');


		/**
		Cover
		String getAddress(String objId)
		Method
		**/

		String accountAddress = CA_InsystonCalculatorController.getAddress(account.Id);
		String contactAddress = CA_InsystonCalculatorController.getAddress(contact.Id);


		/**
		Cover
		String getContactMobile(String objId)
		Method
		**/

		String contactMobile = CA_InsystonCalculatorController.getContactMobile(contact.Id);
		String contactMobileNull = CA_InsystonCalculatorController.getContactMobile('0032800000gLckk');//Pass Fake Id

		/**
		Cover
		String getAbnFromAccount(String objId)
		Method
		**/

		String accountABN = CA_InsystonCalculatorController.getAbnFromAccount(account.Id);


	}
}