if cfg_classlimits==0{
    cl_scout=255
    cl_pyro=255
    cl_soldier=255
    cl_heavy=255
    cl_demoman=255
    cl_medic=255
    cl_engineer=255
    cl_spy=255
    cl_sniper=255
    cl_quote=255
}else if cfg_classlimits==1{
    cl_scout=1
    cl_pyro=1
    cl_soldier=1
    cl_heavy=1
    cl_demoman=1
    cl_medic=1
    cl_engineer=1
    cl_spy=1
    cl_sniper=1
    cl_quote=1
}else{
    cl_scout=min(255, max(0,real(get_integer("Classlimits#Runner",255))))
    cl_pyro=min(255, max(0,real(get_integer("Classlimits#Firebug",255))))
    cl_soldier=min(255, max(0,real(get_integer("Classlimits#Rocketman",255))))
    cl_heavy=min(255, max(0,real(get_integer("Classlimits#Overweight",255))))
    cl_demoman=min(255, max(0,real(get_integer("Classlimits#Detonator",255))))
    cl_medic=min(255, max(0,real(get_integer("Classlimits#Healer",255))))
    cl_engineer=min(255, max(0,real(get_integer("Classlimits#Constructor",255))))
    cl_spy=min(255, max(0,real(get_integer("Classlimits#Infiltrator",255))))
    cl_sniper=min(255, max(0,real(get_integer("Classlimits#Rifleman",255))))
    cl_quote=min(255, max(0,real(get_integer("Classlimits#Quote",255))))
}
