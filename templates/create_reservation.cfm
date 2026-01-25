<cfinclude template="inc/globals.cfm">

<cfset events = [] >

<cfloop from="1" to="#arrayLen(listToArray(url.date))#" index="i">
    <cfset events[i] = { 
        "show_id" = listToArray(url.show_id)[i],
        "date" = listToArray(url.date)[i]
    } >
</cfloop>

<cfset reservation = {
    "students" = url.students,
    "teachers" = url.teachers,
    "parents" = url.parents,
    "postShow" = url.postShow,
    "memo" = url.memo,
    "special_needs" = false,
    "taxable" = true,
    "schoolId" = url.schoolId,
    "school" = url.school,
    "address" = url.address,
    "city" = url.city,
    "phone" = url.phone,
    "firstname" = url.firstname,
    "lastname" = url.lastname,
    "email" = url.email,
    "cell" = url.cell,
    "state" = "Texas",
    "zip" = url.zip,
    "events" = events
}>

<cfhttp result="res" method="POST" charset="utf-8" url="#api_url#/public/createReservation">
    <cfhttpparam type="header" name="Accept" value="application/json" />
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfhttpparam type="body" value="#serializeJSON(reservation)#" />
</cfhttp>

<cfcontent reset="true" type="application/json">

<cfoutput>
    #res.filecontent#
</cfoutput>