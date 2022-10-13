select  KPID.KPI_Code as Codigo_KPI, 
PL.Plant, 
PL.PlantId,
CAL.[Month],
KPID.KPIDefinitionId,
CAL.Period, 
KPID.KPI_Group,
KPID.KPI_Name as Nombre_KPI,
BOPS.AC, 
BOPS.BU,
BOPS.LY,
BOPS.LE,
BOPS.AC_BU,
BOPS.AC_LY,
BOPS.BU_LE, 
BOPS.AC_BU_PERCENT, 
BOPS.AC_LY_PERCENT,
BOPS.LoadDate as FechadeCarga, 
BOPS.ZoneId, 
BOPS.PlantId, 
BOPS.LocationTypeId,
L.LocationType,
BOPS.PeriodTypeID, 
c.BU ,  
U.UOM
from [dwkpi].[dim_KPI_Definition] as KPID
inner join [dwkpi].[fct_BOPS_Plant_Full] as BOPS on KPID.KPIDefinitionId = BOPS.KPIDefinitionId  and BOPS.PeriodTypeID = 1
inner join [dwkpi].[dim_Calendar] as CAL on BOPS.CalendarId = CaL.CalendarId
inner join [dwkpi].[dim_UOM] as U on BOPS.UOMId = U.UOMId
inner join [dwkpi].[dim_Country] as C on BOPS.CountryId = C.CountryId
inner join [dwkpi].[dim_LocationType] as L on BOPS.LocationTypeId = L.LocationTypeID
inner join [dwkpi].[dim_Plant] as PL on BOPS.PlantId = PL.PlantId
where BOPS.ZoneId = 8 
and LocationType = 'Zone'
and CAL.YEAR = 2022
and 
(KPID.KPI_Code = 'PG-K1280' or KPID.KPI_Code = 'PG-K1260' or KPID.KPI_Code = 'PG-K0260' or KPID.KPI_Code = 'PG-K1091' or KPID.KPI_Code = 'PG-K6018' or KPID.KPI_Code = 'PG-K0412' or
KPID.KPI_Code = 'PG-K1312' or KPID.KPI_Code = 'PG-K0545' or KPID.KPI_Code = 'PG-K0541' or KPID.KPI_Code = 'PG-K0511' or KPID.KPI_Code = 'PG-K0510' or KPID.KPI_Code = 'PG-K1221' or
KPID.KPI_Code = 'PG-K0618' or KPID.KPI_Code = 'PG-K0650')
and [Month] = 6


