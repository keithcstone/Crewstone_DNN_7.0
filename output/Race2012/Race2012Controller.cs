using System.Collections.Generic;
using System.Xml;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Services.Search;
using System.ComponentModel;
using DotNetNuke.Entities.Modules;

namespace Crewstone Consulting ltd.Modules.Race2012.Providers
{
	public class Race2012Controller
	/*// : DotNetNuke.Entities.Modules.ISearchable, DotNetNuke.Entities.Modules.IPortable*/
	{
	#region "Public Methods"		
		// Get a single Bounces item by primary key
		public BouncesInfo GetBounces(string eMail)
		{
            return CBO.FillObject<BouncesInfo>(DataProvider.Instance().GetBounces(eMail));
		}

		public List<BouncesInfo> ListBounces()
		{
			return CBO.FillCollection<BouncesInfo>(DataProvider.Instance().ListBounces());
		}

	
		public void AddBounces(BouncesInfo objBounces)
		{
			DataProvider.Instance().AddBounces(objBounces.PortalId);
		}
	
		public void UpdateBounces(BouncesInfo objBounces)
		{
			DataProvider.Instance().UpdateBounces(objBounces.EMail, objBounces.PortalId);
		}
		
		public void DeleteBounces(string eMail)
		{
			DataProvider.Instance().DeleteBounces(eMail);
		}
	
		// Get a single ContactTypes item by primary key
		public ContactTypesInfo GetContactTypes(int contactType)
		{
            return CBO.FillObject<ContactTypesInfo>(DataProvider.Instance().GetContactTypes(contactType));
		}

		public List<ContactTypesInfo> ListContactTypes()
		{
			return CBO.FillCollection<ContactTypesInfo>(DataProvider.Instance().ListContactTypes());
		}

	
		public void AddContactTypes(ContactTypesInfo objContactTypes)
		{
			DataProvider.Instance().AddContactTypes(objContactTypes.PortalId, objContactTypes.Abbreviation, objContactTypes.Description, objContactTypes.DefaultType);
		}
	
		public void UpdateContactTypes(ContactTypesInfo objContactTypes)
		{
			DataProvider.Instance().UpdateContactTypes(objContactTypes.ContactType, objContactTypes.PortalId, objContactTypes.Abbreviation, objContactTypes.Description, objContactTypes.DefaultType);
		}
		
		public void DeleteContactTypes(int contactType)
		{
			DataProvider.Instance().DeleteContactTypes(contactType);
		}
	
		// Get a single Divisions item by primary key
		public DivisionsInfo GetDivisions(string division)
		{
            return CBO.FillObject<DivisionsInfo>(DataProvider.Instance().GetDivisions(division));
		}

		public List<DivisionsInfo> ListDivisions()
		{
			return CBO.FillCollection<DivisionsInfo>(DataProvider.Instance().ListDivisions());
		}

	
		public void AddDivisions(DivisionsInfo objDivisions)
		{
			DataProvider.Instance().AddDivisions(objDivisions.PortalId, objDivisions.Description, objDivisions.Priority, objDivisions.Overall, objDivisions.Masters);
		}
	
		public void UpdateDivisions(DivisionsInfo objDivisions)
		{
			DataProvider.Instance().UpdateDivisions(objDivisions.Division, objDivisions.PortalId, objDivisions.Description, objDivisions.Priority, objDivisions.Overall, objDivisions.Masters);
		}
		
		public void DeleteDivisions(string division)
		{
			DataProvider.Instance().DeleteDivisions(division);
		}
	
		// Get a single DoNotEmail item by primary key
		public DoNotEmailInfo GetDoNotEmail(string emailAddress)
		{
            return CBO.FillObject<DoNotEmailInfo>(DataProvider.Instance().GetDoNotEmail(emailAddress));
		}

		public List<DoNotEmailInfo> ListDoNotEmail()
		{
			return CBO.FillCollection<DoNotEmailInfo>(DataProvider.Instance().ListDoNotEmail());
		}

	
		public void AddDoNotEmail(DoNotEmailInfo objDoNotEmail)
		{
			DataProvider.Instance().AddDoNotEmail(objDoNotEmail.PortalId, objDoNotEmail.MovedBy, objDoNotEmail.OptOutReason);
		}
	
		public void UpdateDoNotEmail(DoNotEmailInfo objDoNotEmail)
		{
			DataProvider.Instance().UpdateDoNotEmail(objDoNotEmail.EmailAddress, objDoNotEmail.PortalId, objDoNotEmail.MovedBy, objDoNotEmail.OptOutReason);
		}
		
		public void DeleteDoNotEmail(string emailAddress)
		{
			DataProvider.Instance().DeleteDoNotEmail(emailAddress);
		}
	
		// Get a single Entrants item by primary key
		public EntrantsInfo GetEntrants(int runnerId)
		{
            return CBO.FillObject<EntrantsInfo>(DataProvider.Instance().GetEntrants(runnerId));
		}

		public List<EntrantsInfo> ListEntrants()
		{
			return CBO.FillCollection<EntrantsInfo>(DataProvider.Instance().ListEntrants());
		}

		public EntrantsInfo GetByContactTypes(int contactType)
		{
			return CBO.FillObject<EntrantsInfo>(DataProvider.Instance().GetEntrantsByContactTypes(contactType));
		}
		public EntrantsInfo GetByEntrants(int runnerId)
		{
			return CBO.FillObject<EntrantsInfo>(DataProvider.Instance().GetEntrantsByEntrants(runnerId));
		}
	
		public void AddEntrants(EntrantsInfo objEntrants)
		{
			DataProvider.Instance().AddEntrants(objEntrants.PortalId, objEntrants.ContactType, objEntrants.FullName, objEntrants.FirstName, objEntrants.MiddleName, objEntrants.LastName, objEntrants.Suffix, objEntrants.Nickname, objEntrants.BirthDate, objEntrants.Age, objEntrants.Weight, objEntrants.Sex, objEntrants.TShirt, objEntrants.Sweats, objEntrants.Shorts, objEntrants.Shoes, objEntrants.ShoeStyle, objEntrants.Club, objEntrants.Address, objEntrants.City, objEntrants.State, objEntrants.ZIP, objEntrants.Country, objEntrants.HomePhone, objEntrants.MobilePhone, objEntrants.MobileCarrier, objEntrants.EMail, objEntrants.PlainText, objEntrants.USATFNumber, objEntrants.MemberType, objEntrants.MemberNumber, objEntrants.MemberCode, objEntrants.DateJoined, objEntrants.LastRenewal, objEntrants.PaidThru, objEntrants.Waiver, objEntrants.PrimaryNo, objEntrants.Survivor, objEntrants.MailingExpiration, objEntrants.Memo, objEntrants.Marked, objEntrants.Keywords, objEntrants.Company, objEntrants.Title, objEntrants.WorkAddress, objEntrants.WorkCity, objEntrants.WorkState, objEntrants.WorkZip, objEntrants.WorkCountry, objEntrants.WorkPhone, objEntrants.WorkEmail, objEntrants.ActiveId, objEntrants.InvalidEmail, objEntrants.ResultsEmailOnly, objEntrants.InvalidAddress, objEntrants.UserName, objEntrants.Password, objEntrants.InsertionDate, objEntrants.UpdateDate);
		}
	
		public void UpdateEntrants(EntrantsInfo objEntrants)
		{
			DataProvider.Instance().UpdateEntrants(objEntrants.RunnerId, objEntrants.PortalId, objEntrants.ContactType, objEntrants.FullName, objEntrants.FirstName, objEntrants.MiddleName, objEntrants.LastName, objEntrants.Suffix, objEntrants.Nickname, objEntrants.BirthDate, objEntrants.Age, objEntrants.Weight, objEntrants.Sex, objEntrants.TShirt, objEntrants.Sweats, objEntrants.Shorts, objEntrants.Shoes, objEntrants.ShoeStyle, objEntrants.Club, objEntrants.Address, objEntrants.City, objEntrants.State, objEntrants.ZIP, objEntrants.Country, objEntrants.HomePhone, objEntrants.MobilePhone, objEntrants.MobileCarrier, objEntrants.EMail, objEntrants.PlainText, objEntrants.USATFNumber, objEntrants.MemberType, objEntrants.MemberNumber, objEntrants.MemberCode, objEntrants.DateJoined, objEntrants.LastRenewal, objEntrants.PaidThru, objEntrants.Waiver, objEntrants.PrimaryNo, objEntrants.Survivor, objEntrants.MailingExpiration, objEntrants.Memo, objEntrants.Marked, objEntrants.Keywords, objEntrants.Company, objEntrants.Title, objEntrants.WorkAddress, objEntrants.WorkCity, objEntrants.WorkState, objEntrants.WorkZip, objEntrants.WorkCountry, objEntrants.WorkPhone, objEntrants.WorkEmail, objEntrants.ActiveId, objEntrants.InvalidEmail, objEntrants.ResultsEmailOnly, objEntrants.InvalidAddress, objEntrants.UserName, objEntrants.Password, objEntrants.InsertionDate, objEntrants.UpdateDate);
		}
		
		public void DeleteEntrants(int runnerId)
		{
			DataProvider.Instance().DeleteEntrants(runnerId);
		}
	
		// Get a single Events item by primary key
		public EventsInfo GetEvents(int runnerId, int raceId)
		{
            return CBO.FillObject<EventsInfo>(DataProvider.Instance().GetEvents(runnerId, raceId));
		}

		public List<EventsInfo> ListEvents()
		{
			return CBO.FillCollection<EventsInfo>(DataProvider.Instance().ListEvents());
		}

		public EventsInfo GetByEntrants(int runnerId)
		{
			return CBO.FillObject<EventsInfo>(DataProvider.Instance().GetEventsByEntrants(runnerId));
		}
		public EventsInfo GetByRaces(int raceId)
		{
			return CBO.FillObject<EventsInfo>(DataProvider.Instance().GetEventsByRaces(raceId));
		}
	
		public void AddEvents(EventsInfo objEvents)
		{
			DataProvider.Instance().AddEvents(objEvents.PortalId, objEvents.BibNumber, objEvents.Division, objEvents.DivisionPlace, objEvents.DivisionTotal, objEvents.SexPlace, objEvents.SexTotal, objEvents.GunTime, objEvents.NetTime, objEvents.Pace, objEvents.Place, objEvents.Seed, objEvents.Team, objEvents.Fee, objEvents.EntryDate, objEvents.Clydesdale, objEvents.Survivor, objEvents.NonCompetitive, objEvents.USATF, objEvents.Age, objEvents.Sex, objEvents.Weight, objEvents.Heat, objEvents.WaveOffset, objEvents.WAVATime, objEvents.PerformancePercent, objEvents.SeriesPlace, objEvents.SeriesAge, objEvents.SeriesDivision, objEvents.SeriesPoints, objEvents.Confirmation, objEvents.Results, objEvents.ChipId, objEvents.AwardDivision, objEvents.AwardPlace, objEvents.AwardPriority);
		}
	
		public void UpdateEvents(EventsInfo objEvents)
		{
			DataProvider.Instance().UpdateEvents(objEvents.RunnerId, objEvents.RaceId, objEvents.PortalId, objEvents.BibNumber, objEvents.Division, objEvents.DivisionPlace, objEvents.DivisionTotal, objEvents.SexPlace, objEvents.SexTotal, objEvents.GunTime, objEvents.NetTime, objEvents.Pace, objEvents.Place, objEvents.Seed, objEvents.Team, objEvents.Fee, objEvents.EntryDate, objEvents.Clydesdale, objEvents.Survivor, objEvents.NonCompetitive, objEvents.USATF, objEvents.Age, objEvents.Sex, objEvents.Weight, objEvents.Heat, objEvents.WaveOffset, objEvents.WAVATime, objEvents.PerformancePercent, objEvents.SeriesPlace, objEvents.SeriesAge, objEvents.SeriesDivision, objEvents.SeriesPoints, objEvents.Confirmation, objEvents.Results, objEvents.ChipId, objEvents.AwardDivision, objEvents.AwardPlace, objEvents.AwardPriority);
		}
		
		public void DeleteEvents(int runnerId, int raceId)
		{
			DataProvider.Instance().DeleteEvents(runnerId, raceId);
		}
	
		// Get a single EventTypes item by primary key
		public EventTypesInfo GetEventTypes(int eventTypeId)
		{
            return CBO.FillObject<EventTypesInfo>(DataProvider.Instance().GetEventTypes(eventTypeId));
		}

		public List<EventTypesInfo> ListEventTypes()
		{
			return CBO.FillCollection<EventTypesInfo>(DataProvider.Instance().ListEventTypes());
		}

	
		public void AddEventTypes(EventTypesInfo objEventTypes)
		{
			DataProvider.Instance().AddEventTypes(objEventTypes.PortalId, objEventTypes.EventTypeName, objEventTypes.DefaultType);
		}
	
		public void UpdateEventTypes(EventTypesInfo objEventTypes)
		{
			DataProvider.Instance().UpdateEventTypes(objEventTypes.EventTypeId, objEventTypes.PortalId, objEventTypes.EventTypeName, objEventTypes.DefaultType);
		}
		
		public void DeleteEventTypes(int eventTypeId)
		{
			DataProvider.Instance().DeleteEventTypes(eventTypeId);
		}
	
		// Get a single MemberTypes item by primary key
		public MemberTypesInfo GetMemberTypes(int memberTypeID)
		{
            return CBO.FillObject<MemberTypesInfo>(DataProvider.Instance().GetMemberTypes(memberTypeID));
		}

		public List<MemberTypesInfo> ListMemberTypes()
		{
			return CBO.FillCollection<MemberTypesInfo>(DataProvider.Instance().ListMemberTypes());
		}

	
		public void AddMemberTypes(MemberTypesInfo objMemberTypes)
		{
			DataProvider.Instance().AddMemberTypes(objMemberTypes.PortalId, objMemberTypes.MemberType, objMemberTypes.MemberDues);
		}
	
		public void UpdateMemberTypes(MemberTypesInfo objMemberTypes)
		{
			DataProvider.Instance().UpdateMemberTypes(objMemberTypes.MemberTypeID, objMemberTypes.PortalId, objMemberTypes.MemberType, objMemberTypes.MemberDues);
		}
		
		public void DeleteMemberTypes(int memberTypeID)
		{
			DataProvider.Instance().DeleteMemberTypes(memberTypeID);
		}
	
		// Get a single Organization item by primary key
		public OrganizationInfo GetOrganization(int orgID)
		{
            return CBO.FillObject<OrganizationInfo>(DataProvider.Instance().GetOrganization(orgID));
		}

		public List<OrganizationInfo> ListOrganization()
		{
			return CBO.FillCollection<OrganizationInfo>(DataProvider.Instance().ListOrganization());
		}

	
		public void AddOrganization(OrganizationInfo objOrganization)
		{
			DataProvider.Instance().AddOrganization(objOrganization.PortalId, objOrganization.ClubName, objOrganization.Address, objOrganization.City, objOrganization.StateOrProvince, objOrganization.PostalCode, objOrganization.Country, objOrganization.DefaultInvoiceDescription, objOrganization.PhoneNumber, objOrganization.FaxNumber, objOrganization.EMail, objOrganization.Nickname, objOrganization.MailingExpirePeriod, objOrganization.LastEmail, objOrganization.LastLetters);
		}
	
		public void UpdateOrganization(OrganizationInfo objOrganization)
		{
			DataProvider.Instance().UpdateOrganization(objOrganization.OrgID, objOrganization.PortalId, objOrganization.ClubName, objOrganization.Address, objOrganization.City, objOrganization.StateOrProvince, objOrganization.PostalCode, objOrganization.Country, objOrganization.DefaultInvoiceDescription, objOrganization.PhoneNumber, objOrganization.FaxNumber, objOrganization.EMail, objOrganization.Nickname, objOrganization.MailingExpirePeriod, objOrganization.LastEmail, objOrganization.LastLetters);
		}
		
		public void DeleteOrganization(int orgID)
		{
			DataProvider.Instance().DeleteOrganization(orgID);
		}
	
		// Get a single RaceDivisions item by primary key
		public RaceDivisionsInfo GetRaceDivisions(int raceId, int priority)
		{
            return CBO.FillObject<RaceDivisionsInfo>(DataProvider.Instance().GetRaceDivisions(raceId, priority));
		}

		public List<RaceDivisionsInfo> ListRaceDivisions()
		{
			return CBO.FillCollection<RaceDivisionsInfo>(DataProvider.Instance().ListRaceDivisions());
		}

		public RaceDivisionsInfo GetByRaces(int raceId)
		{
			return CBO.FillObject<RaceDivisionsInfo>(DataProvider.Instance().GetRaceDivisionsByRaces(raceId));
		}
	
		public void AddRaceDivisions(RaceDivisionsInfo objRaceDivisions)
		{
			DataProvider.Instance().AddRaceDivisions(objRaceDivisions.PortalId, objRaceDivisions.Sex, objRaceDivisions.StartAge, objRaceDivisions.EndAge, objRaceDivisions.StartWeight, objRaceDivisions.EndWeight, objRaceDivisions.Survivor, objRaceDivisions.Division, objRaceDivisions.Depth, objRaceDivisions.Overall, objRaceDivisions.Masters, objRaceDivisions.USATF);
		}
	
		public void UpdateRaceDivisions(RaceDivisionsInfo objRaceDivisions)
		{
			DataProvider.Instance().UpdateRaceDivisions(objRaceDivisions.RaceId, objRaceDivisions.Priority, objRaceDivisions.PortalId, objRaceDivisions.Sex, objRaceDivisions.StartAge, objRaceDivisions.EndAge, objRaceDivisions.StartWeight, objRaceDivisions.EndWeight, objRaceDivisions.Survivor, objRaceDivisions.Division, objRaceDivisions.Depth, objRaceDivisions.Overall, objRaceDivisions.Masters, objRaceDivisions.USATF);
		}
		
		public void DeleteRaceDivisions(int raceId, int priority)
		{
			DataProvider.Instance().DeleteRaceDivisions(raceId, priority);
		}
	
		// Get a single Races item by primary key
		public RacesInfo GetRaces(int raceId)
		{
            return CBO.FillObject<RacesInfo>(DataProvider.Instance().GetRaces(raceId));
		}

		public List<RacesInfo> ListRaces()
		{
			return CBO.FillCollection<RacesInfo>(DataProvider.Instance().ListRaces());
		}

		public RacesInfo GetByEventTypes(int eventTypeId)
		{
			return CBO.FillObject<RacesInfo>(DataProvider.Instance().GetRacesByEventTypes(eventTypeId));
		}
	
		public void AddRaces(RacesInfo objRaces)
		{
			DataProvider.Instance().AddRaces(objRaces.PortalId, objRaces.EventType, objRaces.RaceName, objRaces.RaceDate, objRaces.RaceDistance, objRaces.RaceLocation, objRaces.RaceCity, objRaces.RaceState, objRaces.RaceCountry, objRaces.RaceLogo, objRaces.USATFNumber, objRaces.RodaleEventId, objRaces.ActiveEventId, objRaces.PreregistrationDate, objRaces.PreregistrationFee, objRaces.RaceDayFee, objRaces.RegistrationURL, objRaces.RegistrationLogo, objRaces.Description, objRaces.EmailText, objRaces.ResultsText, objRaces.ResultsURL, objRaces.Annual, objRaces.Keyword, objRaces.LastBibNumber, objRaces.ContactName, objRaces.ContactAddress1, objRaces.ContactAddress2, objRaces.ContactCity, objRaces.ContactState, objRaces.ContactZIP, objRaces.ContactPhoneNumber, objRaces.ContactFAX, objRaces.ContactEMail, objRaces.WEBSite, objRaces.RelatedRace, objRaces.Organization, objRaces.VolunteerContact, objRaces.VolunteerPhone, objRaces.VolunteerEmail, objRaces.DisplayStartDate, objRaces.DisplayEndDate, objRaces.InsertionDate, objRaces.ModificationDate);
		}
	
		public void UpdateRaces(RacesInfo objRaces)
		{
			DataProvider.Instance().UpdateRaces(objRaces.RaceId, objRaces.PortalId, objRaces.EventType, objRaces.RaceName, objRaces.RaceDate, objRaces.RaceDistance, objRaces.RaceLocation, objRaces.RaceCity, objRaces.RaceState, objRaces.RaceCountry, objRaces.RaceLogo, objRaces.USATFNumber, objRaces.RodaleEventId, objRaces.ActiveEventId, objRaces.PreregistrationDate, objRaces.PreregistrationFee, objRaces.RaceDayFee, objRaces.RegistrationURL, objRaces.RegistrationLogo, objRaces.Description, objRaces.EmailText, objRaces.ResultsText, objRaces.ResultsURL, objRaces.Annual, objRaces.Keyword, objRaces.LastBibNumber, objRaces.ContactName, objRaces.ContactAddress1, objRaces.ContactAddress2, objRaces.ContactCity, objRaces.ContactState, objRaces.ContactZIP, objRaces.ContactPhoneNumber, objRaces.ContactFAX, objRaces.ContactEMail, objRaces.WEBSite, objRaces.RelatedRace, objRaces.Organization, objRaces.VolunteerContact, objRaces.VolunteerPhone, objRaces.VolunteerEmail, objRaces.DisplayStartDate, objRaces.DisplayEndDate, objRaces.InsertionDate, objRaces.ModificationDate);
		}
		
		public void DeleteRaces(int raceId)
		{
			DataProvider.Instance().DeleteRaces(raceId);
		}
	
		// Get a single ZIP item by primary key
		public ZIPInfo GetZIP(string fiveDigitZIP, short sequence)
		{
            return CBO.FillObject<ZIPInfo>(DataProvider.Instance().GetZIP(fiveDigitZIP, sequence));
		}

		public List<ZIPInfo> ListZIP()
		{
			return CBO.FillCollection<ZIPInfo>(DataProvider.Instance().ListZIP());
		}

	
		public void AddZIP(ZIPInfo objZIP)
		{
			DataProvider.Instance().AddZIP(objZIP.PortalId, objZIP.City, objZIP.State, objZIP.County, objZIP.Country);
		}
	
		public void UpdateZIP(ZIPInfo objZIP)
		{
			DataProvider.Instance().UpdateZIP(objZIP.FiveDigitZIP, objZIP.Sequence, objZIP.PortalId, objZIP.City, objZIP.State, objZIP.County, objZIP.Country);
		}
		
		public void DeleteZIP(string fiveDigitZIP, short sequence)
		{
			DataProvider.Instance().DeleteZIP(fiveDigitZIP, sequence);
		}
	
	
		#endregion

		#region "Optional Interfaces"		
  /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// GetSearchItems implements the ISearchable Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModInfo">The ModuleInfo for the module to be Indexed</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public SearchItemInfoCollection GetSearchItems(Race2012 ModInfo)
        {
            SearchItemInfoCollection SearchItemCollection = new SearchItemInfoCollection();
			// TODO
			// Modify to suit fields in table
            List<BouncesInfo> colBounces = ListBounces();
            foreach (BouncesInfo objBounces in colBounces)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<ContactTypesInfo> colContactTypes = ListContactTypes();
            foreach (ContactTypesInfo objContactTypes in colContactTypes)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<DivisionsInfo> colDivisions = ListDivisions();
            foreach (DivisionsInfo objDivisions in colDivisions)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<DoNotEmailInfo> colDoNotEmail = ListDoNotEmail();
            foreach (DoNotEmailInfo objDoNotEmail in colDoNotEmail)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<EntrantsInfo> colEntrants = ListEntrants();
            foreach (EntrantsInfo objEntrants in colEntrants)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<EventsInfo> colEvents = ListEvents();
            foreach (EventsInfo objEvents in colEvents)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<EventTypesInfo> colEventTypes = ListEventTypes();
            foreach (EventTypesInfo objEventTypes in colEventTypes)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<MemberTypesInfo> colMemberTypes = ListMemberTypes();
            foreach (MemberTypesInfo objMemberTypes in colMemberTypes)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<OrganizationInfo> colOrganization = ListOrganization();
            foreach (OrganizationInfo objOrganization in colOrganization)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<RaceDivisionsInfo> colRaceDivisions = ListRaceDivisions();
            foreach (RaceDivisionsInfo objRaceDivisions in colRaceDivisions)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<RacesInfo> colRaces = ListRaces();
            foreach (RacesInfo objRaces in colRaces)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }
			// TODO
			// Modify to suit fields in table
            List<ZIPInfo> colZIP = ListZIP();
            foreach (ZIPInfo objZIP in colZIP)
            {
            //    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objDNN_CS_unmodified.Content, objDNN_CS_unmodified.CreatedByUser, objDNN_CS_unmodified.CreatedDate, ModInfo.ModuleID, objDNN_CS_unmodified.ItemId.ToString(), objDNN_CS_unmodified.Content, "ItemId=" + objDNN_CS_unmodified.ItemId.ToString());
            //    SearchItemCollection.Add(SearchItem);
            }

            return SearchItemCollection;
        }
	
        /// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// ExportModule implements the IPortable ExportModule Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="moduleId">The Id of the module to be exported</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public string ExportModule(int moduleId)
        {

            string strXML = "";
			// TOTO
			// Modify to match fields in table
            List<BouncesInfo> colBounces = ListBounces();
            if (colBounces.Count != 0)
            {
                strXML += "<Bouncess>";
                foreach (BouncesInfo objBounces in colBounces)
                {
                    strXML += "<Bounces>";
                    strXML += "</Bounces>";
                }
                strXML += "</Bouncess>";
            }
			// TOTO
			// Modify to match fields in table
            List<ContactTypesInfo> colContactTypes = ListContactTypes();
            if (colContactTypes.Count != 0)
            {
                strXML += "<ContactTypess>";
                foreach (ContactTypesInfo objContactTypes in colContactTypes)
                {
                    strXML += "<ContactTypes>";
                    	strXML += "<Abbreviation>"; 
							strXML += XmlUtils.XMLEncode(objContactTypes.Abbreviation.ToString()); 
						strXML += "</Abbreviation>";
                    	strXML += "<Description>"; 
							strXML += XmlUtils.XMLEncode(objContactTypes.Description.ToString()); 
						strXML += "</Description>";
                    	strXML += "<DefaultType>"; 
							strXML += XmlUtils.XMLEncode(objContactTypes.DefaultType.ToString()); 
						strXML += "</DefaultType>";
                    strXML += "</ContactTypes>";
                }
                strXML += "</ContactTypess>";
            }
			// TOTO
			// Modify to match fields in table
            List<DivisionsInfo> colDivisions = ListDivisions();
            if (colDivisions.Count != 0)
            {
                strXML += "<Divisionss>";
                foreach (DivisionsInfo objDivisions in colDivisions)
                {
                    strXML += "<Divisions>";
                    	strXML += "<Description>"; 
							strXML += XmlUtils.XMLEncode(objDivisions.Description.ToString()); 
						strXML += "</Description>";
                    	strXML += "<Priority>"; 
							strXML += XmlUtils.XMLEncode(objDivisions.Priority.ToString()); 
						strXML += "</Priority>";
                    	strXML += "<Overall>"; 
							strXML += XmlUtils.XMLEncode(objDivisions.Overall.ToString()); 
						strXML += "</Overall>";
                    	strXML += "<Masters>"; 
							strXML += XmlUtils.XMLEncode(objDivisions.Masters.ToString()); 
						strXML += "</Masters>";
                    strXML += "</Divisions>";
                }
                strXML += "</Divisionss>";
            }
			// TOTO
			// Modify to match fields in table
            List<DoNotEmailInfo> colDoNotEmail = ListDoNotEmail();
            if (colDoNotEmail.Count != 0)
            {
                strXML += "<DoNotEmails>";
                foreach (DoNotEmailInfo objDoNotEmail in colDoNotEmail)
                {
                    strXML += "<DoNotEmail>";
                    	strXML += "<MovedBy>"; 
							strXML += XmlUtils.XMLEncode(objDoNotEmail.MovedBy.ToString()); 
						strXML += "</MovedBy>";
                    	strXML += "<OptOutReason>"; 
							strXML += XmlUtils.XMLEncode(objDoNotEmail.OptOutReason.ToString()); 
						strXML += "</OptOutReason>";
                    strXML += "</DoNotEmail>";
                }
                strXML += "</DoNotEmails>";
            }
			// TOTO
			// Modify to match fields in table
            List<EntrantsInfo> colEntrants = ListEntrants();
            if (colEntrants.Count != 0)
            {
                strXML += "<Entrantss>";
                foreach (EntrantsInfo objEntrants in colEntrants)
                {
                    strXML += "<Entrants>";
                    	strXML += "<ContactType>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.ContactType.ToString()); 
						strXML += "</ContactType>";
                    	strXML += "<FullName>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.FullName.ToString()); 
						strXML += "</FullName>";
                    	strXML += "<FirstName>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.FirstName.ToString()); 
						strXML += "</FirstName>";
                    	strXML += "<MiddleName>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MiddleName.ToString()); 
						strXML += "</MiddleName>";
                    	strXML += "<LastName>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.LastName.ToString()); 
						strXML += "</LastName>";
                    	strXML += "<Suffix>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Suffix.ToString()); 
						strXML += "</Suffix>";
                    	strXML += "<Nickname>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Nickname.ToString()); 
						strXML += "</Nickname>";
                    	strXML += "<BirthDate>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.BirthDate.ToString()); 
						strXML += "</BirthDate>";
                    	strXML += "<Age>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Age.ToString()); 
						strXML += "</Age>";
                    	strXML += "<Weight>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Weight.ToString()); 
						strXML += "</Weight>";
                    	strXML += "<Sex>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Sex.ToString()); 
						strXML += "</Sex>";
                    	strXML += "<TShirt>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.TShirt.ToString()); 
						strXML += "</TShirt>";
                    	strXML += "<Sweats>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Sweats.ToString()); 
						strXML += "</Sweats>";
                    	strXML += "<Shorts>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Shorts.ToString()); 
						strXML += "</Shorts>";
                    	strXML += "<Shoes>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Shoes.ToString()); 
						strXML += "</Shoes>";
                    	strXML += "<ShoeStyle>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.ShoeStyle.ToString()); 
						strXML += "</ShoeStyle>";
                    	strXML += "<Club>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Club.ToString()); 
						strXML += "</Club>";
                    	strXML += "<Address>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Address.ToString()); 
						strXML += "</Address>";
                    	strXML += "<City>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.City.ToString()); 
						strXML += "</City>";
                    	strXML += "<State>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.State.ToString()); 
						strXML += "</State>";
                    	strXML += "<ZIP>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.ZIP.ToString()); 
						strXML += "</ZIP>";
                    	strXML += "<Country>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Country.ToString()); 
						strXML += "</Country>";
                    	strXML += "<HomePhone>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.HomePhone.ToString()); 
						strXML += "</HomePhone>";
                    	strXML += "<MobilePhone>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MobilePhone.ToString()); 
						strXML += "</MobilePhone>";
                    	strXML += "<MobileCarrier>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MobileCarrier.ToString()); 
						strXML += "</MobileCarrier>";
                    	strXML += "<EMail>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.EMail.ToString()); 
						strXML += "</EMail>";
                    	strXML += "<PlainText>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.PlainText.ToString()); 
						strXML += "</PlainText>";
                    	strXML += "<USATFNumber>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.USATFNumber.ToString()); 
						strXML += "</USATFNumber>";
                    	strXML += "<MemberType>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MemberType.ToString()); 
						strXML += "</MemberType>";
                    	strXML += "<MemberNumber>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MemberNumber.ToString()); 
						strXML += "</MemberNumber>";
                    	strXML += "<MemberCode>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MemberCode.ToString()); 
						strXML += "</MemberCode>";
                    	strXML += "<DateJoined>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.DateJoined.ToString()); 
						strXML += "</DateJoined>";
                    	strXML += "<LastRenewal>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.LastRenewal.ToString()); 
						strXML += "</LastRenewal>";
                    	strXML += "<PaidThru>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.PaidThru.ToString()); 
						strXML += "</PaidThru>";
                    	strXML += "<Waiver>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Waiver.ToString()); 
						strXML += "</Waiver>";
                    	strXML += "<PrimaryNo>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.PrimaryNo.ToString()); 
						strXML += "</PrimaryNo>";
                    	strXML += "<Survivor>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Survivor.ToString()); 
						strXML += "</Survivor>";
                    	strXML += "<MailingExpiration>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.MailingExpiration.ToString()); 
						strXML += "</MailingExpiration>";
                    	strXML += "<Memo>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Memo.ToString()); 
						strXML += "</Memo>";
                    	strXML += "<Marked>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Marked.ToString()); 
						strXML += "</Marked>";
                    	strXML += "<Keywords>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Keywords.ToString()); 
						strXML += "</Keywords>";
                    	strXML += "<Company>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Company.ToString()); 
						strXML += "</Company>";
                    	strXML += "<Title>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Title.ToString()); 
						strXML += "</Title>";
                    	strXML += "<WorkAddress>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkAddress.ToString()); 
						strXML += "</WorkAddress>";
                    	strXML += "<WorkCity>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkCity.ToString()); 
						strXML += "</WorkCity>";
                    	strXML += "<WorkState>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkState.ToString()); 
						strXML += "</WorkState>";
                    	strXML += "<WorkZip>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkZip.ToString()); 
						strXML += "</WorkZip>";
                    	strXML += "<WorkCountry>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkCountry.ToString()); 
						strXML += "</WorkCountry>";
                    	strXML += "<WorkPhone>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkPhone.ToString()); 
						strXML += "</WorkPhone>";
                    	strXML += "<WorkEmail>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.WorkEmail.ToString()); 
						strXML += "</WorkEmail>";
                    	strXML += "<ActiveId>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.ActiveId.ToString()); 
						strXML += "</ActiveId>";
                    	strXML += "<InvalidEmail>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.InvalidEmail.ToString()); 
						strXML += "</InvalidEmail>";
                    	strXML += "<ResultsEmailOnly>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.ResultsEmailOnly.ToString()); 
						strXML += "</ResultsEmailOnly>";
                    	strXML += "<InvalidAddress>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.InvalidAddress.ToString()); 
						strXML += "</InvalidAddress>";
                    	strXML += "<UserName>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.UserName.ToString()); 
						strXML += "</UserName>";
                    	strXML += "<Password>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.Password.ToString()); 
						strXML += "</Password>";
                    	strXML += "<InsertionDate>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.InsertionDate.ToString()); 
						strXML += "</InsertionDate>";
                    	strXML += "<UpdateDate>"; 
							strXML += XmlUtils.XMLEncode(objEntrants.UpdateDate.ToString()); 
						strXML += "</UpdateDate>";
                    strXML += "</Entrants>";
                }
                strXML += "</Entrantss>";
            }
			// TOTO
			// Modify to match fields in table
            List<EventsInfo> colEvents = ListEvents();
            if (colEvents.Count != 0)
            {
                strXML += "<Eventss>";
                foreach (EventsInfo objEvents in colEvents)
                {
                    strXML += "<Events>";
                    	strXML += "<BibNumber>"; 
							strXML += XmlUtils.XMLEncode(objEvents.BibNumber.ToString()); 
						strXML += "</BibNumber>";
                    	strXML += "<Division>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Division.ToString()); 
						strXML += "</Division>";
                    	strXML += "<DivisionPlace>"; 
							strXML += XmlUtils.XMLEncode(objEvents.DivisionPlace.ToString()); 
						strXML += "</DivisionPlace>";
                    	strXML += "<DivisionTotal>"; 
							strXML += XmlUtils.XMLEncode(objEvents.DivisionTotal.ToString()); 
						strXML += "</DivisionTotal>";
                    	strXML += "<SexPlace>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SexPlace.ToString()); 
						strXML += "</SexPlace>";
                    	strXML += "<SexTotal>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SexTotal.ToString()); 
						strXML += "</SexTotal>";
                    	strXML += "<GunTime>"; 
							strXML += XmlUtils.XMLEncode(objEvents.GunTime.ToString()); 
						strXML += "</GunTime>";
                    	strXML += "<NetTime>"; 
							strXML += XmlUtils.XMLEncode(objEvents.NetTime.ToString()); 
						strXML += "</NetTime>";
                    	strXML += "<Pace>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Pace.ToString()); 
						strXML += "</Pace>";
                    	strXML += "<Place>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Place.ToString()); 
						strXML += "</Place>";
                    	strXML += "<Seed>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Seed.ToString()); 
						strXML += "</Seed>";
                    	strXML += "<Team>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Team.ToString()); 
						strXML += "</Team>";
                    	strXML += "<Fee>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Fee.ToString()); 
						strXML += "</Fee>";
                    	strXML += "<EntryDate>"; 
							strXML += XmlUtils.XMLEncode(objEvents.EntryDate.ToString()); 
						strXML += "</EntryDate>";
                    	strXML += "<Clydesdale>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Clydesdale.ToString()); 
						strXML += "</Clydesdale>";
                    	strXML += "<Survivor>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Survivor.ToString()); 
						strXML += "</Survivor>";
                    	strXML += "<NonCompetitive>"; 
							strXML += XmlUtils.XMLEncode(objEvents.NonCompetitive.ToString()); 
						strXML += "</NonCompetitive>";
                    	strXML += "<USATF>"; 
							strXML += XmlUtils.XMLEncode(objEvents.USATF.ToString()); 
						strXML += "</USATF>";
                    	strXML += "<Age>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Age.ToString()); 
						strXML += "</Age>";
                    	strXML += "<Sex>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Sex.ToString()); 
						strXML += "</Sex>";
                    	strXML += "<Weight>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Weight.ToString()); 
						strXML += "</Weight>";
                    	strXML += "<Heat>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Heat.ToString()); 
						strXML += "</Heat>";
                    	strXML += "<WaveOffset>"; 
							strXML += XmlUtils.XMLEncode(objEvents.WaveOffset.ToString()); 
						strXML += "</WaveOffset>";
                    	strXML += "<WAVATime>"; 
							strXML += XmlUtils.XMLEncode(objEvents.WAVATime.ToString()); 
						strXML += "</WAVATime>";
                    	strXML += "<PerformancePercent>"; 
							strXML += XmlUtils.XMLEncode(objEvents.PerformancePercent.ToString()); 
						strXML += "</PerformancePercent>";
                    	strXML += "<SeriesPlace>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SeriesPlace.ToString()); 
						strXML += "</SeriesPlace>";
                    	strXML += "<SeriesAge>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SeriesAge.ToString()); 
						strXML += "</SeriesAge>";
                    	strXML += "<SeriesDivision>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SeriesDivision.ToString()); 
						strXML += "</SeriesDivision>";
                    	strXML += "<SeriesPoints>"; 
							strXML += XmlUtils.XMLEncode(objEvents.SeriesPoints.ToString()); 
						strXML += "</SeriesPoints>";
                    	strXML += "<Confirmation>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Confirmation.ToString()); 
						strXML += "</Confirmation>";
                    	strXML += "<Results>"; 
							strXML += XmlUtils.XMLEncode(objEvents.Results.ToString()); 
						strXML += "</Results>";
                    	strXML += "<ChipId>"; 
							strXML += XmlUtils.XMLEncode(objEvents.ChipId.ToString()); 
						strXML += "</ChipId>";
                    	strXML += "<AwardDivision>"; 
							strXML += XmlUtils.XMLEncode(objEvents.AwardDivision.ToString()); 
						strXML += "</AwardDivision>";
                    	strXML += "<AwardPlace>"; 
							strXML += XmlUtils.XMLEncode(objEvents.AwardPlace.ToString()); 
						strXML += "</AwardPlace>";
                    	strXML += "<AwardPriority>"; 
							strXML += XmlUtils.XMLEncode(objEvents.AwardPriority.ToString()); 
						strXML += "</AwardPriority>";
                    strXML += "</Events>";
                }
                strXML += "</Eventss>";
            }
			// TOTO
			// Modify to match fields in table
            List<EventTypesInfo> colEventTypes = ListEventTypes();
            if (colEventTypes.Count != 0)
            {
                strXML += "<EventTypess>";
                foreach (EventTypesInfo objEventTypes in colEventTypes)
                {
                    strXML += "<EventTypes>";
                    	strXML += "<EventTypeName>"; 
							strXML += XmlUtils.XMLEncode(objEventTypes.EventTypeName.ToString()); 
						strXML += "</EventTypeName>";
                    	strXML += "<DefaultType>"; 
							strXML += XmlUtils.XMLEncode(objEventTypes.DefaultType.ToString()); 
						strXML += "</DefaultType>";
                    strXML += "</EventTypes>";
                }
                strXML += "</EventTypess>";
            }
			// TOTO
			// Modify to match fields in table
            List<MemberTypesInfo> colMemberTypes = ListMemberTypes();
            if (colMemberTypes.Count != 0)
            {
                strXML += "<MemberTypess>";
                foreach (MemberTypesInfo objMemberTypes in colMemberTypes)
                {
                    strXML += "<MemberTypes>";
                    	strXML += "<MemberType>"; 
							strXML += XmlUtils.XMLEncode(objMemberTypes.MemberType.ToString()); 
						strXML += "</MemberType>";
                    	strXML += "<MemberDues>"; 
							strXML += XmlUtils.XMLEncode(objMemberTypes.MemberDues.ToString()); 
						strXML += "</MemberDues>";
                    strXML += "</MemberTypes>";
                }
                strXML += "</MemberTypess>";
            }
			// TOTO
			// Modify to match fields in table
            List<OrganizationInfo> colOrganization = ListOrganization();
            if (colOrganization.Count != 0)
            {
                strXML += "<Organizations>";
                foreach (OrganizationInfo objOrganization in colOrganization)
                {
                    strXML += "<Organization>";
                    	strXML += "<ClubName>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.ClubName.ToString()); 
						strXML += "</ClubName>";
                    	strXML += "<Address>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.Address.ToString()); 
						strXML += "</Address>";
                    	strXML += "<City>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.City.ToString()); 
						strXML += "</City>";
                    	strXML += "<StateOrProvince>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.StateOrProvince.ToString()); 
						strXML += "</StateOrProvince>";
                    	strXML += "<PostalCode>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.PostalCode.ToString()); 
						strXML += "</PostalCode>";
                    	strXML += "<Country>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.Country.ToString()); 
						strXML += "</Country>";
                    	strXML += "<DefaultInvoiceDescription>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.DefaultInvoiceDescription.ToString()); 
						strXML += "</DefaultInvoiceDescription>";
                    	strXML += "<PhoneNumber>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.PhoneNumber.ToString()); 
						strXML += "</PhoneNumber>";
                    	strXML += "<FaxNumber>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.FaxNumber.ToString()); 
						strXML += "</FaxNumber>";
                    	strXML += "<EMail>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.EMail.ToString()); 
						strXML += "</EMail>";
                    	strXML += "<Nickname>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.Nickname.ToString()); 
						strXML += "</Nickname>";
                    	strXML += "<MailingExpirePeriod>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.MailingExpirePeriod.ToString()); 
						strXML += "</MailingExpirePeriod>";
                    	strXML += "<LastEmail>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.LastEmail.ToString()); 
						strXML += "</LastEmail>";
                    	strXML += "<LastLetters>"; 
							strXML += XmlUtils.XMLEncode(objOrganization.LastLetters.ToString()); 
						strXML += "</LastLetters>";
                    strXML += "</Organization>";
                }
                strXML += "</Organizations>";
            }
			// TOTO
			// Modify to match fields in table
            List<RaceDivisionsInfo> colRaceDivisions = ListRaceDivisions();
            if (colRaceDivisions.Count != 0)
            {
                strXML += "<RaceDivisionss>";
                foreach (RaceDivisionsInfo objRaceDivisions in colRaceDivisions)
                {
                    strXML += "<RaceDivisions>";
                    	strXML += "<Sex>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Sex.ToString()); 
						strXML += "</Sex>";
                    	strXML += "<StartAge>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.StartAge.ToString()); 
						strXML += "</StartAge>";
                    	strXML += "<EndAge>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.EndAge.ToString()); 
						strXML += "</EndAge>";
                    	strXML += "<StartWeight>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.StartWeight.ToString()); 
						strXML += "</StartWeight>";
                    	strXML += "<EndWeight>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.EndWeight.ToString()); 
						strXML += "</EndWeight>";
                    	strXML += "<Survivor>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Survivor.ToString()); 
						strXML += "</Survivor>";
                    	strXML += "<Division>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Division.ToString()); 
						strXML += "</Division>";
                    	strXML += "<Depth>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Depth.ToString()); 
						strXML += "</Depth>";
                    	strXML += "<Overall>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Overall.ToString()); 
						strXML += "</Overall>";
                    	strXML += "<Masters>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.Masters.ToString()); 
						strXML += "</Masters>";
                    	strXML += "<USATF>"; 
							strXML += XmlUtils.XMLEncode(objRaceDivisions.USATF.ToString()); 
						strXML += "</USATF>";
                    strXML += "</RaceDivisions>";
                }
                strXML += "</RaceDivisionss>";
            }
			// TOTO
			// Modify to match fields in table
            List<RacesInfo> colRaces = ListRaces();
            if (colRaces.Count != 0)
            {
                strXML += "<Racess>";
                foreach (RacesInfo objRaces in colRaces)
                {
                    strXML += "<Races>";
                    	strXML += "<EventType>"; 
							strXML += XmlUtils.XMLEncode(objRaces.EventType.ToString()); 
						strXML += "</EventType>";
                    	strXML += "<RaceName>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceName.ToString()); 
						strXML += "</RaceName>";
                    	strXML += "<RaceDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceDate.ToString()); 
						strXML += "</RaceDate>";
                    	strXML += "<RaceDistance>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceDistance.ToString()); 
						strXML += "</RaceDistance>";
                    	strXML += "<RaceLocation>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceLocation.ToString()); 
						strXML += "</RaceLocation>";
                    	strXML += "<RaceCity>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceCity.ToString()); 
						strXML += "</RaceCity>";
                    	strXML += "<RaceState>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceState.ToString()); 
						strXML += "</RaceState>";
                    	strXML += "<RaceCountry>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceCountry.ToString()); 
						strXML += "</RaceCountry>";
                    	strXML += "<RaceLogo>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceLogo.ToString()); 
						strXML += "</RaceLogo>";
                    	strXML += "<USATFNumber>"; 
							strXML += XmlUtils.XMLEncode(objRaces.USATFNumber.ToString()); 
						strXML += "</USATFNumber>";
                    	strXML += "<RodaleEventId>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RodaleEventId.ToString()); 
						strXML += "</RodaleEventId>";
                    	strXML += "<ActiveEventId>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ActiveEventId.ToString()); 
						strXML += "</ActiveEventId>";
                    	strXML += "<PreregistrationDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.PreregistrationDate.ToString()); 
						strXML += "</PreregistrationDate>";
                    	strXML += "<PreregistrationFee>"; 
							strXML += XmlUtils.XMLEncode(objRaces.PreregistrationFee.ToString()); 
						strXML += "</PreregistrationFee>";
                    	strXML += "<RaceDayFee>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RaceDayFee.ToString()); 
						strXML += "</RaceDayFee>";
                    	strXML += "<RegistrationURL>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RegistrationURL.ToString()); 
						strXML += "</RegistrationURL>";
                    	strXML += "<RegistrationLogo>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RegistrationLogo.ToString()); 
						strXML += "</RegistrationLogo>";
                    	strXML += "<Description>"; 
							strXML += XmlUtils.XMLEncode(objRaces.Description.ToString()); 
						strXML += "</Description>";
                    	strXML += "<EmailText>"; 
							strXML += XmlUtils.XMLEncode(objRaces.EmailText.ToString()); 
						strXML += "</EmailText>";
                    	strXML += "<ResultsText>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ResultsText.ToString()); 
						strXML += "</ResultsText>";
                    	strXML += "<ResultsURL>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ResultsURL.ToString()); 
						strXML += "</ResultsURL>";
                    	strXML += "<Annual>"; 
							strXML += XmlUtils.XMLEncode(objRaces.Annual.ToString()); 
						strXML += "</Annual>";
                    	strXML += "<Keyword>"; 
							strXML += XmlUtils.XMLEncode(objRaces.Keyword.ToString()); 
						strXML += "</Keyword>";
                    	strXML += "<LastBibNumber>"; 
							strXML += XmlUtils.XMLEncode(objRaces.LastBibNumber.ToString()); 
						strXML += "</LastBibNumber>";
                    	strXML += "<ContactName>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactName.ToString()); 
						strXML += "</ContactName>";
                    	strXML += "<ContactAddress1>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactAddress1.ToString()); 
						strXML += "</ContactAddress1>";
                    	strXML += "<ContactAddress2>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactAddress2.ToString()); 
						strXML += "</ContactAddress2>";
                    	strXML += "<ContactCity>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactCity.ToString()); 
						strXML += "</ContactCity>";
                    	strXML += "<ContactState>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactState.ToString()); 
						strXML += "</ContactState>";
                    	strXML += "<ContactZIP>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactZIP.ToString()); 
						strXML += "</ContactZIP>";
                    	strXML += "<ContactPhoneNumber>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactPhoneNumber.ToString()); 
						strXML += "</ContactPhoneNumber>";
                    	strXML += "<ContactFAX>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactFAX.ToString()); 
						strXML += "</ContactFAX>";
                    	strXML += "<ContactEMail>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ContactEMail.ToString()); 
						strXML += "</ContactEMail>";
                    	strXML += "<WEBSite>"; 
							strXML += XmlUtils.XMLEncode(objRaces.WEBSite.ToString()); 
						strXML += "</WEBSite>";
                    	strXML += "<RelatedRace>"; 
							strXML += XmlUtils.XMLEncode(objRaces.RelatedRace.ToString()); 
						strXML += "</RelatedRace>";
                    	strXML += "<Organization>"; 
							strXML += XmlUtils.XMLEncode(objRaces.Organization.ToString()); 
						strXML += "</Organization>";
                    	strXML += "<VolunteerContact>"; 
							strXML += XmlUtils.XMLEncode(objRaces.VolunteerContact.ToString()); 
						strXML += "</VolunteerContact>";
                    	strXML += "<VolunteerPhone>"; 
							strXML += XmlUtils.XMLEncode(objRaces.VolunteerPhone.ToString()); 
						strXML += "</VolunteerPhone>";
                    	strXML += "<VolunteerEmail>"; 
							strXML += XmlUtils.XMLEncode(objRaces.VolunteerEmail.ToString()); 
						strXML += "</VolunteerEmail>";
                    	strXML += "<DisplayStartDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.DisplayStartDate.ToString()); 
						strXML += "</DisplayStartDate>";
                    	strXML += "<DisplayEndDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.DisplayEndDate.ToString()); 
						strXML += "</DisplayEndDate>";
                    	strXML += "<InsertionDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.InsertionDate.ToString()); 
						strXML += "</InsertionDate>";
                    	strXML += "<ModificationDate>"; 
							strXML += XmlUtils.XMLEncode(objRaces.ModificationDate.ToString()); 
						strXML += "</ModificationDate>";
                    strXML += "</Races>";
                }
                strXML += "</Racess>";
            }
			// TOTO
			// Modify to match fields in table
            List<ZIPInfo> colZIP = ListZIP();
            if (colZIP.Count != 0)
            {
                strXML += "<ZIPs>";
                foreach (ZIPInfo objZIP in colZIP)
                {
                    strXML += "<ZIP>";
                    	strXML += "<City>"; 
							strXML += XmlUtils.XMLEncode(objZIP.City.ToString()); 
						strXML += "</City>";
                    	strXML += "<State>"; 
							strXML += XmlUtils.XMLEncode(objZIP.State.ToString()); 
						strXML += "</State>";
                    	strXML += "<County>"; 
							strXML += XmlUtils.XMLEncode(objZIP.County.ToString()); 
						strXML += "</County>";
                    	strXML += "<Country>"; 
							strXML += XmlUtils.XMLEncode(objZIP.Country.ToString()); 
						strXML += "</Country>";
                    strXML += "</ZIP>";
                }
                strXML += "</ZIPs>";
            }

            return strXML;
        }
		
		/// ----------------------------------------------------------------------------- 
        /// <summary> 
        /// ImportModule implements the IPortable ImportModule Interface 
        /// </summary> 
        /// <remarks> 
        /// </remarks> 
        /// <param name="ModuleID">The Id of the module to be imported</param> 
        /// <param name="Content">The content to be imported</param> 
        /// <param name="Version">The version of the module to be imported</param> 
        /// <param name="UserId">The Id of the user performing the import</param> 
        /// <history> 
        /// </history> 
        /// ----------------------------------------------------------------------------- 
        public void ImportModule(int ModuleID, string Content, string Version, int UserId)
        {
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlBouncesInfo = Globals.GetContent(Content, "BouncesInfo");
            foreach (XmlNode xmlBounces in xmlBouncesInfo.SelectNodes("BouncesInfo"))
            {
                // BouncesInfo objBounces = new BouncesInfo();
                // objBouncesInfo.ModuleId = ModuleID;
                // objBouncesInfo.Content = xmlBouncesInfo.SelectSingleNode("content").InnerText;
                // objBouncesInfo.CreatedByUser = UserId;
                // AddBouncesInfo(objBouncesInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlContactTypesInfo = Globals.GetContent(Content, "ContactTypesInfo");
            foreach (XmlNode xmlContactTypes in xmlContactTypesInfo.SelectNodes("ContactTypesInfo"))
            {
                // ContactTypesInfo objContactTypes = new ContactTypesInfo();
                // objContactTypesInfo.ModuleId = ModuleID;
                // objContactTypesInfo.Content = xmlContactTypesInfo.SelectSingleNode("content").InnerText;
                // objContactTypesInfo.CreatedByUser = UserId;
                // AddContactTypesInfo(objContactTypesInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlDivisionsInfo = Globals.GetContent(Content, "DivisionsInfo");
            foreach (XmlNode xmlDivisions in xmlDivisionsInfo.SelectNodes("DivisionsInfo"))
            {
                // DivisionsInfo objDivisions = new DivisionsInfo();
                // objDivisionsInfo.ModuleId = ModuleID;
                // objDivisionsInfo.Content = xmlDivisionsInfo.SelectSingleNode("content").InnerText;
                // objDivisionsInfo.CreatedByUser = UserId;
                // AddDivisionsInfo(objDivisionsInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlDoNotEmailInfo = Globals.GetContent(Content, "DoNotEmailInfo");
            foreach (XmlNode xmlDoNotEmail in xmlDoNotEmailInfo.SelectNodes("DoNotEmailInfo"))
            {
                // DoNotEmailInfo objDoNotEmail = new DoNotEmailInfo();
                // objDoNotEmailInfo.ModuleId = ModuleID;
                // objDoNotEmailInfo.Content = xmlDoNotEmailInfo.SelectSingleNode("content").InnerText;
                // objDoNotEmailInfo.CreatedByUser = UserId;
                // AddDoNotEmailInfo(objDoNotEmailInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlEntrantsInfo = Globals.GetContent(Content, "EntrantsInfo");
            foreach (XmlNode xmlEntrants in xmlEntrantsInfo.SelectNodes("EntrantsInfo"))
            {
                // EntrantsInfo objEntrants = new EntrantsInfo();
                // objEntrantsInfo.ModuleId = ModuleID;
                // objEntrantsInfo.Content = xmlEntrantsInfo.SelectSingleNode("content").InnerText;
                // objEntrantsInfo.CreatedByUser = UserId;
                // AddEntrantsInfo(objEntrantsInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlEventsInfo = Globals.GetContent(Content, "EventsInfo");
            foreach (XmlNode xmlEvents in xmlEventsInfo.SelectNodes("EventsInfo"))
            {
                // EventsInfo objEvents = new EventsInfo();
                // objEventsInfo.ModuleId = ModuleID;
                // objEventsInfo.Content = xmlEventsInfo.SelectSingleNode("content").InnerText;
                // objEventsInfo.CreatedByUser = UserId;
                // AddEventsInfo(objEventsInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlEventTypesInfo = Globals.GetContent(Content, "EventTypesInfo");
            foreach (XmlNode xmlEventTypes in xmlEventTypesInfo.SelectNodes("EventTypesInfo"))
            {
                // EventTypesInfo objEventTypes = new EventTypesInfo();
                // objEventTypesInfo.ModuleId = ModuleID;
                // objEventTypesInfo.Content = xmlEventTypesInfo.SelectSingleNode("content").InnerText;
                // objEventTypesInfo.CreatedByUser = UserId;
                // AddEventTypesInfo(objEventTypesInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlMemberTypesInfo = Globals.GetContent(Content, "MemberTypesInfo");
            foreach (XmlNode xmlMemberTypes in xmlMemberTypesInfo.SelectNodes("MemberTypesInfo"))
            {
                // MemberTypesInfo objMemberTypes = new MemberTypesInfo();
                // objMemberTypesInfo.ModuleId = ModuleID;
                // objMemberTypesInfo.Content = xmlMemberTypesInfo.SelectSingleNode("content").InnerText;
                // objMemberTypesInfo.CreatedByUser = UserId;
                // AddMemberTypesInfo(objMemberTypesInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlOrganizationInfo = Globals.GetContent(Content, "OrganizationInfo");
            foreach (XmlNode xmlOrganization in xmlOrganizationInfo.SelectNodes("OrganizationInfo"))
            {
                // OrganizationInfo objOrganization = new OrganizationInfo();
                // objOrganizationInfo.ModuleId = ModuleID;
                // objOrganizationInfo.Content = xmlOrganizationInfo.SelectSingleNode("content").InnerText;
                // objOrganizationInfo.CreatedByUser = UserId;
                // AddOrganizationInfo(objOrganizationInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlRaceDivisionsInfo = Globals.GetContent(Content, "RaceDivisionsInfo");
            foreach (XmlNode xmlRaceDivisions in xmlRaceDivisionsInfo.SelectNodes("RaceDivisionsInfo"))
            {
                // RaceDivisionsInfo objRaceDivisions = new RaceDivisionsInfo();
                // objRaceDivisionsInfo.ModuleId = ModuleID;
                // objRaceDivisionsInfo.Content = xmlRaceDivisionsInfo.SelectSingleNode("content").InnerText;
                // objRaceDivisionsInfo.CreatedByUser = UserId;
                // AddRaceDivisionsInfo(objRaceDivisionsInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlRacesInfo = Globals.GetContent(Content, "RacesInfo");
            foreach (XmlNode xmlRaces in xmlRacesInfo.SelectNodes("RacesInfo"))
            {
                // RacesInfo objRaces = new RacesInfo();
                // objRacesInfo.ModuleId = ModuleID;
                // objRacesInfo.Content = xmlRacesInfo.SelectSingleNode("content").InnerText;
                // objRacesInfo.CreatedByUser = UserId;
                // AddRacesInfo(objRacesInfo);
            }

        }
			// TODO 
			// Modify to match fields in table
			// Need to code for different data types on import
            XmlNode xmlZIPInfo = Globals.GetContent(Content, "ZIPInfo");
            foreach (XmlNode xmlZIP in xmlZIPInfo.SelectNodes("ZIPInfo"))
            {
                // ZIPInfo objZIP = new ZIPInfo();
                // objZIPInfo.ModuleId = ModuleID;
                // objZIPInfo.Content = xmlZIPInfo.SelectSingleNode("content").InnerText;
                // objZIPInfo.CreatedByUser = UserId;
                // AddZIPInfo(objZIPInfo);
            }

        }
		#endregion
	}
}
