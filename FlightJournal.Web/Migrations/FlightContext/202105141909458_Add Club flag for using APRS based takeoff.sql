﻿ALTER TABLE [dbo].[Clubs] ADD [UseAPRSTakeoffAndLanding] [bit] NOT NULL DEFAULT 0
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'202105141922276_Add Club flag for using APRS takeoff and landing', N'FlightJournal.Web.Migrations.FlightContext.Configuration',  0x1F8B0800000000000400ED7D5B6F1C3992EEFB01CE7F28E869CFA247B2BBF7E18C61ED4296E43EDAB15B8225CFEC9B90AA4AC9096765D66466F55A38D85FB60FFB93F62F6CDE9397083278C94BA985017AAC4A32180C7E0C068364C47FFFE77FBDFF971FDB78F57B98E5519A9C1EBD3D7E73B40A9375BA8992A7D3A37DF1F8A7FF7BF42FFFFCBFFFD7FBCBCDF6C7EAAF5DB95FAA7265CD243F3DFA5614BB772727F9FA5BB80DF2E36DB4CED23C7D2C8ED7E9F624D8A4273FBF79F3E793B76F4FC292C451496BB57AFF659F14D136ACFF28FF3C4F9375B82BF641FC39DD8471DEFE5E7EB9ADA9AE7E0BB661BE0BD6E1E9D1C7387AFA56FC6BBACF92203EFE5BF870DCD4395A9DC55150F2731BC68F47AB2049D222284A6EDF7DCDC3DB224B93A7DB5DF94310DF3DEFC2B2DC6310E761DB8B7743716A87DEFC5C75E864A8D8915AEFF322DD1A127CFB4B2BA113B1BA959C8F7A099632BC2C655D3C57BDAEE5787A74B6DBC551B8B9FC1166EBA89281D8E6BBF338ABCAE3D23EBECB8228294172DC94381668FEB4926AFED4C3A74459F5BF9F56E7FBB8D867E16912EE8B2C887F5ADDEC1FE268FD97F0F92EFD1E26A7C93E8ED9AE949D29BF713F943FDD64E92ECC8AE72FE123DCC1ABCDD1EA84277322D2E9A9E0241A895C25C52F3F1FAD7E2B590B1EE2B0C71123BDDB22CDC25FC324CC8222DCDC04451166250CAE36613D12123342D38DE486167FDD471BA0413591B375039E864435278EBBBE749F74147F0B7E8F9EEA1E09B407E07C09E3BA40FE2DDAB5AD0882BB1F0A7FCCD2ED97349685DB97B9BF2DE1B22E8BDEA59A827741F6141674967FCD824AA59138EECBE20CB745B4FC76E54CD9BD4AF222DBAF4B1C9138668BE34C0FA5B47C33454D59FF14E679852E02DB5D519CE5A68496DDB69829ABE59F4F59B025F1DA97C5996D8B68B9EDCA41ECBE3F19B4B5528777FAF7673F5AFC3C2882387DDA87C712E17955B9C48E8D3207894CA5CE87363FA6D9E58F5D9A154E9ABDFA6FAFD78BACD6549F831F9FC2E4A9F8767A54FEB30469F423DC74BFB454BF265169D79595CA991D9AB79A163E5AD52D5A95191894C6E0791695528E82D19BBCCA3F6451F85812BF4EE2E7AEB90F69397303C21A2950BB88F25D1C3C5F679B30D321CC4CA1E6A096EA81DD6AC00E6B39ABA7D042BD06EA34155EB2D3696EBAAA53F89E35554376217AAA61C6494B0D24A6D2515D8B87ACA16EB2709D269B88B37BC7521B37FB6C97E633F47206153986526314957FB5261A607A056868316AB8EE0CBC5E73034C0B6570552C16F4A3897B73D6B32A6EE92E4417B7DC38296386C654DAB86FD28F3ABEFD565298C96A9CCD56CD47578B5FB378F436DA29E3BF1D376BD346C1A14A19D384560AAEF7DDB8E8B5D292D8545B827073DCD29B579FB54CD8A831A6EA54DAAB6F7251C6A4669E05F13E34B46DA48DE4F577D7ED63E329CAEF52764F7A1364D5A9056303796AE4260BD645B40E62DF2DD81A8CE4597E13C5696135C7EB9AF3CEE69A059BB9DC579C6A26CFB37A97B5D9CDEF6873FE73B87D08B3291A4A1FA2F8B77DD5DAE86D5D6E83687CB3E43CDE3FE881B80087E2E58FA8B8088686AA7FDF455BBD32EFCF3FC6C0076A7C5572052DAFEAC37D3DFF39638BF959DA40B2DFA03DA38A8F463DFEBFA854AFD9F3FD87B0DCE695DA11E4AC29DA2A4FA106CBAAAA9CC4BBB2B05B676A897C08D6DFF330280CBAC4D5D3768C2B4DEB1E5FC543274D3B47EB9441672C3BA1E21BE354C99B1B37F7C3A06BD8C2D141C2831704E4C3DCC3B945A7A766425A4FC1BA67B7A551B28707B71920AED4C09AF451DA4ACA259CF6908D16B6302EAB8AF3DA96DDC26C6A5AD216747F96A54F97D402B68F9FD2752D16579BA8044B1E4D6016FD35CAA3922BD77DDE799A14E516F22A794CB36D30C9B9CBD73C3CBBF9727B177C0FD3C7C7B364F329481A878F61577007583B96B81D3694102CB1EE83A4A0F8AFC6870EF86A4EB00B415E049BD1428FD7972871653E14BA6FD4A9A0CF85EFD2820316325D76CAFA598133DA7F9658E4BF48CC099F9D4E640630592C385DE579171D56FB992E3C74CDB938B7866607797E763D7A235FC2A7D2E00EB37073FD943410F8943E9D45D96314C61B77F5BE4F8AEC797C6F421656E358EDCBF322D8EEE4CDBA29E30DC10FE3B3FE29C88BAFBB8D5FF619A2DEBB60E6621D14B0BDB375A0B100B76BC38CB5F375A8FEA274D54598AFB36837890107EE349CFD63563607B88DC40C13AB49D41B0A56D3A7AF3DEFC4E9D9B099365CE5D7DDE582A60CD9FA15A709621C5B4D10C8796835572042F34E9BE115CF89BE706BB198CF2F2F6F85FAD61D0D974A774EB05A81E739A647D4E1AE447139EEA6274382BFC1B05A6D52BBF9886EE2202168530D11DA51328148E7AFD62928FB75414DA87549BB92A9F9093795127425550D75B92193B7B4EA6A77C1FA5B2AC332DDD78E3A425D1199A49A539A7E17611C826A86BC1D5AF4D64AB50AEB0F651C4F50C5459A74DC4A7689B688A6B33FD4D0F0DF15A475A02F6DE5B81CE73C94C4387F3C69C435E1F8D1E35135BD37D26926B957D50266D09BA6B8AE17552922F7755153AE990582CE3B5749D303A62CAD1F6C05ABDE341B53A3BE3455283DA93708F47ED4C59DB6122D4E6CDC5455CD999D539D5167EC96A25983FEF6D68DCB39F375DA67EC92DEEEC222E24F0CA66B7E3AC74233D1A6EE5F3D2126F06704F9F8CF33AEFF3D99E0BEE524B7186F9BAB6A2E9B92CBE4294A42572296B729F1CDDEEBC1D021EC5E2EC2C7A05CF8D446436356C94519273C584276C3C3C54C4D1CCA6542D8B4142C44F1961E67693A783D1DFC9CCBF46C4EE4AD7CF5FFBDFAFF5E1D777741FEFDA2B4C4AB4800CB75F9F9F4CE9EA77921F6D4904EA37F3C10AAC7CD039D97EF1295B68FEB34DB94EB8421201C3CAB84EBEEB09F624C7FA9C243AAF3898EE705D5BCAE40D819D7B769F8B442C5E3681E4B8D2189F134A21F52ED7924F81A47F72EAAFC895A0FA22F9FE179BADD864949CBEED2011430602039F34B909E0FABF7205CEDA97C8B6CAB7E8207B414A7F7A4F988063046DCA541C4153DE451415FE65E2ACEBC31404BC94F0EF0A2A6AAA59B72CDD43AEBA1D7D26DFF0FEF1BBDFE3DAB1CE4F8264604D0E84E66549C9C0EBCE447D077F3DF54E47971D37B53DF59145BF6A4FF3C9D23CCA8A8A2B1B494F4605EAFD016ADA5445BCA9A881F6DC5996F561A8BDEAC9708F6F4E69611DD4EE4937AD55461188EA455551CBBB8854CAC5433EDEBDFDC5A9235828562B3B369EC4CCF25EA3D2F72B13AACC25A7295124ED74A5E585117C9A134BD84C7973B3EE24A7128EBC2981A7B61695026B99FF1B728D9DCEEC2D07111AAC85C4459C8656E715D813E0749BAFF3D333434EF996A7A4D3194262B02A6CA825D0053A94F07835BAB92ADD467373ADEDC041DC1795564C7858D4A64EB4EA5028736FDB8037A7A45B87D51AF8AAFD6E5E4C8F3696E16568DB969FA311C2698229848F1535518B05658692836E595858E1AAACFAB91F84093A63A090A53E95B2B99458CF8943E5D3641436CE345741416102DA26425B20D15D1D67550D65EEE688946B4E54DAF34E7D3AAF43117862FC6375FA65B1D3A5D44CDAB6342ED6CB7CBD2DFCDAFF0C0543E3CB703864FEC3FFA8522CD855F3C3C48A758EEBB82427810E13B1C1E442CE4EF0A0E4F5EBA89037CD67068772F87C7258153B102C6325F4EC3BB50D8AD13F8E432EE9E8A14ADE33805239128C878F19B79C8D4B6A4AC6CEE49D9A6CFC9C6B77C5ED2784ADD4F3A9AD61FA309DE464DB9C47F09FFBE8FCA4D45A7DBDD6EDEF0D486B9D5CCBA2076A57F9954859D03F4DDA65931CA1E92879C7203D96968A4A6BC87545640FD87EA5A1E55DEC0BAB3EAEB482D4905B26AC44D15D215D2D82AB1FA36BA829973CA92A12C9C2078F2DD7254E70533C78A0D8625025341976F98F1BF7A07407B12E571F06B8AF30F7CCD86EDA0F795A71CF0A6516F83BDDF3243DD65EB3A6B27FB5569AD044F794FD2C33937DF84470094AAB75481F173D9162B175E9E4D7EA6FE1CB77A6051A7693B3D7A23C99E2B5B274FABA6405BFCADBA78DD6BA6B8EC63E18A5721285A1F4B5BE11779FC9A91528C9EE03CF330781CC559C7AA715CD6879541B2A18E9ABCA1A60D5F53EFF247B08DEA800FB451BC2DF69BFA61003C865297823C2F8D0786FE3F5106FDAC3453D6513D828205236736E65BBF4C362B729AE3C1272B655AFF5C0E71B42B07B55428A747FF28F592D24E7FB403B4D395D2B4F4FE8411055142374292512DE33758C65180EF9B2EFFB18580C47654F2218D8381749AE48D9B4EECFD28A1D2C12A40D211CA9A08076DC6063C6F8F4483E03A691CDBAB66292AB57090AF838D6C6E97D370E347B25D26596A8FDBF223CBB56B05106B9FFA96A7FEE6F8F8AD35DCF87C27189348F29381B526C230BDD770BE1486E09035632CE494BF94D6679855C65E109FA7D5BA54C2B6904DD5285947BB2056B12E54022D5C3C8B46C55CDF8CF8E522DC8549B594A9C6C2BDFDBE1941683A199962ADCD65A3048698D8468D33AF9080390100DA9EDFE8206F0F315E08940186738399838BEFB45BCB13C00A4C0D808DAA3A4F8030BC6C760CBA6E53A73F526359D6E5B618527131119854B25E3CAA84E8F9D86063A1F48761669EC1D33184E5A79A0A3D70FB13E10696E9E21103C63EED42936003ADAA04A1092A6F022C657BD465CE13C828BC50461DC9B76E8439CA38507861E2212D07847D281A2354C8516A4686A114F686B01FF0A7F2482C4D68E793C684C40F13F56C39986C148B113E843B5123A35148383DA34AE4389955217223E0C8C9ACC0EBC34D9943428E44350510E5D4E21A408EAC1841A6E6C7A63838648ED82897F3EC62E1E8BAE82653136A97414713BACC60FFAA0ECF4BD9DA78DCC62A99A10CAF22BB9DD96E5629710F9C4CA610899B12FD36C45CB5CDBBD598777371B8DB09EA0682B065B080CC12B605F36F040ED9F42719FB3AF3DE0239339AF0731AED8769A61B19E65453DC1634B39BDB4B30B00FDDA4EE7A511BC0BA51E703F9FAC0119F63426390CF7FAE0DB14D1A6B38B39515DED841706C7B3A7CB19198359800C3327BC01A14CBF9202E53E0FC4F6F60018343DED50DF9296647A2D26D2016F48F42635FC1B240389777011B9843F22B80793DCD5C9DEA55D8B763F52057685527A65DAF55837728ABB7229FAB1196482BBB67FC1EF8AAAFEFCDE436807E500FCB224033FC9AE34C6D2D8C81EC83B524749D99DEAED00DE86158198D5B8BB955A8BEE5C99644AF781A5FECE4A862DE21FCE2A8D3657DF1AD00F3960AE319AF32F23B06205E89B90FCD4136EDBB1C2ABB62D09A51642204BBA13F275AC47B99EE4515B5B7DD2BAA7165DAB5A2122AF2166C16A9DA4584C7A4E1181E5E96959E90CD8B3A33F6A0DBCE4C70FCA52DFA4E9DA4ACBC9A840E7463C0092D3E389DC048B0EAA3D226B6A6B8F07986D9D762E2851731DF4CED6F5D4E94F1E79DA97D4EE178C6F9C7C41D364531147D5E3FA37CCC1F28FCF1D0F21043DDF7D3780250D06E7BD011DA90F34B5268FA98FBE658392825A7130045796034A6537C3ACCF9EFC5142F9EF1147618F20949EA4876B1F2F53D21671ED51EB0577660CC5EA5EF050DE02B38168618E586CE1D2CF8AFF674D4C975010506A6B1895E99F32486592ED02958209D2A79B8FFA490B2230B135A60EAC09DBA959718C5535E5BED0313D14280A24D0E813D97BA98933A68B2D0E9427E5A2DD6A491F7CDE554C7075854739A3E1444349EE215C74287FDE5619ED21F731079D5EBF068FA626A66442B02D9DB409012D57EE459408888CFB0C0C619B4B6D52EEB389DE530155504493E2061F56BF8A30042397ECDC3369A63DE861E16BB5B51BD0D0BF8A0253F5A5DF6F141B1031349823CC94E722A9A40943622D52E609F8266A7968814DB131A25C9FE144743B30D9306D1EA23A86948B441AA6402ADDDABA95E8521816A37315B3495BB0B2D1081E14A0FA503C32934DA15F6A05A43B23FFF87883177323464B80B091029F84289AEBFD55532B097CD553E12533837FA11E792D9CB03CF6CD3A9949E31598BFB71E214D3FB6054B38FE2DEB364C4A4596D234C763B89E8E0AFD51019D60E880CBBB250A661BB9CC1C810564A3305FC5621394305CCD9E830ABD86E4BD30217171DA22BC4B42790ABA36E63A4DAE8E802196681973B2FC7EA5D31E5E1A50D0BEC0BEE6CF1D0BE7DF780D555B22929843B530820CC744FB4F979F198884E0CE2AB929C32E02FDC3F2CE42FD0BDC186A0080E8BF14B1F100BA9A1C17D01A9D10201739DD38602663A271B9D0AA96983FF8E8C362C742F416C60945F65E7C438BFBE842646F665E80E26ABB3A8F880BE808014117FF9430230E62FC3746BE52A240047F9654830B6AE9F8E77863BD26D28F8ACCCB1107ED6BCCB42D4588640C79F736FC1A0A740B7F5C151E5FD37161E55EC07B7BF50C844191055275D0BD908A13B01A9A8827B72AC23E13D19A6D96D9142064840CF117AAF8A6408C942591EEF10256022DB3D71DFA7909592F498934A19728F2C3B38588ABE8752F0148FD29362A88CA48415A1FEA8E203CE3FF5FDE30F423D0A8E3F019D0C747C2C0C23D1C11134883D95226AF816A514586394C5118EA5062D8F84A86BFC5AA68EBBC6F6A67549A9164675A435D22A638D38FD9A405E05F47A9F029709553C41A9D3D538417193BA3FAD8ED66965A21ED6695E52CFA752B254B56AA848A9AA932E8B49B424171E47210BF9193FC837F774DFB2EFDC837CAD2EB5EF33FBCC1BEF39FA181CE21D7A006E2705E859F7B8AA40B944AA638BA01DC0964553414CB82282F12BC8B617699A28E35DF8B4B5269A498AF00954C199CC3242D0058F429C7C22A2CFF58D64499AA4DA27FEBEE538C93C965F88632E31FC19B9ECBA021F926B57640D1D6C655738D53C38CED9B34BBDEF1CBB33A474730337837C79D0811B3F631846C8537282C0A0CB84CA1E0917097D094AB83638E999567F4D472F2EF045B9B263E29B725F02135F911B1C2F3A1C9E9ABD01579CAC3A3C26074F47ED9E930342235D3A211CD7DA3D2067BDEBDC059D7946105BCA3D3D5976171C6600CC3A9A98E1205D941A6D5099A7AB06A3873D7825490478F24A180F3BE9038F5C99B698BE4F396BF00B604EF387F66AD616B4DA77B3F3CE29ED4B591B88D99CD4E3AF22A1837BE21B4AFE185EFF8A92B83850C94EA2A1C02793D81647F9B452DE9D608F2B450B9BBDCEA8DBF160EF29F5FE2067E1A0EE6DED6B4B45375067B7BD64C6F77DD3DE032AF4AAC143425035D19E12E29B14E95DA9452BDAAD107BF5D53314C52BB93A4CAA9EA62990843C4EF38252E43D9AC1987996A2E27993A17CA90FA5C8D2213C951A614C08AFA39856B91BEEE481AADE06720FA2FA6FEF4F6ED7DFC26DD0FEF0FEA42CB20E77C53E883FA79B30CEBB0F9F83DDAEBAE938D46C7F59DDEE8275B5C4FEE9F668F5631B27F9E9D1B7A2D8BD3B39C96BD2F9F1365A67699E3E16C7EB747B126CD2939FDFBCF9F3C9DBB727DB86C6C99AB309C4E75B7D4B65B783A750F85AADD79BF06394E5C54550040F41752DF77CB3958AF1CFBF78D9F522EEDA425E78C963DCDD64EF2A56FF667DC3FF5A422709E2E3BF850FC78D48A5476102D141B61FCBEE569648DDF310F799C8144A1AB7EB200EB2EE0D24DCA1EA05E4791AEFB709FA5984354EBBC5AF4072F8954EE9AC7D52C0B1063E3368402B884B1CA41369948489238E3E091BF27D692FE0905FF799C383400313BD54551C4FB0007D68875A1FD3ECF2C72ECD0A9E3E58804EBFFA2F4FB0F9C580425A8814EA5F4CE05BA9D0A054A4E75954845914885096BFD3A95FE51FCA05E7B11C82EB247EE6298BDFE8542FA27C1707CFD7D9A6BA59C4D2E4BF2C6EFAE16F525C261F6CC2994C3D8C8276E20D6FD3C169873F5DC76977759029077C9E72C2DD64E13A4D3691ACF3F92F0614F7D92ECD05B6FA1F9732910F76CAF5272A7EE71C72AA6432E95012DA59D7D644A71DF3DD04D96D2564E241DFE9D46FBF9515E4E9C7FC3CF5B299CBEB26B031C2697CCD629E42FD03BD7E7B7F81A7D1FFB89879D4BF1AF3327F908772846983D6C4E4DB56102709F3337DACFA4AC8DC80BE4F89E7BF06F15E20D1FE6462AA5D7F170DB4EA178315A8DE90E577296BD7DD0459158586393197F770DA2A163CDC6441B9092B8B101950947FC1AB24FA56D1626E835E6EC2CC46EAA1EB5417F78E5B9CB06078381DF759F7358964DBB7FF914EE773B87D68D26FB384865F0D28A50F51FCDBBEAA2810633F186C80B74124AC72ED4F741AD59343B16FDD6F536E742F7F4495CF4DA032FC6AA0297BBFA6D82FFECB626679F3EAD3CB24879EB212E6385C6D5CC82CCBE464538871FB59456A319C5A3922792462B9FFD1C07088F2E821164D87EE4783495E79AED7C555F29866DB40DE1C43DF0D146D1E9EDD7CB9BD0BBE87E9E3E359B2A95E31D5A11938CD8B965ACC441C6E737B998C588005C284C4AB4E0360F70975757E762D68DFFA173A852FE153941761166EAE9F9246C89FD2A7B3287B8CC258E8A5AEACC954D9376198F8F9B187623329E96461B96E6DEEA26D9817C176271094BE1A53FE20F238FC6CA0F682BCF8BADB2838854B58B520722C7C5A8C1A90EEE0FBB3BF99587B9696B88A82D2266F2A8296F9F0694A0D7111E6EB2CDAC9AB11F7612C4B76266C314F5DBCA00A7DED43C093A22E6AB4755544412B33432AE82DCA083C0804092FB1BCA0088CB7690E281A99F1CFFCDBA5105C1F8DD059481BD2F627032D279130DDCF5E84BB726EED3391CCF0B3C96A0C58E60A435C43A7B68B4062ED1783F38D2E1138B73A61D9C115743CF99FB837F8203DF6A311A6BC6AD0366086488DF9D990B72169B5C41D9ECF5A8D942AA285B42F617EA753BB0BD6DF52644288DF0CA9825383FF329F6DD3C4EDDF88B4DA1FADAC71D4167FE9D67DF3FADD8F4D0F3DF8A758F270BDB17563B34BCE000710FFC564B7BCDD854504391E844FF3D884CD733B6E460361AA5514EA9116BDF5F54F26766590E7A25959FF44A771FDEF89786AD0FE34A597FEB65CEF849EB43F1978FA93A728110FFAFA1FE73831F0BD26BFFA7E0E7675E89E2279DC56596FA4E6D83ABD6E5768145FB72B960E9FD72D86A72DC65D907FBF288DB6EACAA84891FD32DFA6C5FBD6F43CCD0B0033CDCFA68F4B6462ECEF86232B13637EFE636FF3F0CDC83ACD367F09057ACCCF8B310AB8B7E17EEE69A0915828B7351495151BB5B60EB04F63BE186DFDFA7AC8BD4BA488711B20D5692F4F1EDCD5417D9C0427D85A1E39E908E8C106D922F2571B183775B550968A19B425BB23CE4DFD110707449320275E406A90AECC1CC02EC4510B4291B21E7A400295B3D3DBBE5702DBC9B930688E0C448FB05B2AC8FC3924DC7D964C4238EE3A2696274E478BC95327D24353D835209D05E4AA106416A0EE13289A8318AF8A3ADFDB1AD2E57BE67703577E5F0B59E4C10216F48B708B10AEBFCCB723BF5A972B559E03E711FC17338A32A5176DD0B07153BC4C293CDA0C6152A92AA38376682F24C400397E0E6FB9B4AB1687B8EAFA4A4F6D592D829CB4EDEFD3FB8FFD2DD837690E3DBFEF7F9D4FFBF1611E30C3C72628021C8649457F28E3DA8A1CEC49DD3375BD3FB6AF7219F147DEFADD7E38C71FB10D3F32F63CEB02FBA95B604B19D8359B5222D16324DA24ECEFF369B22FE1DFF7E55623EFA27FF20E74FE9B2DD5412F341A238855ED40A54DAE84040FB138FFFB1F0D4E894A8B1D3024999F173AE799C89323CC7D2C4EA7B10EC009CD3F63611AD5374A5B4DB957C42A10CB39383CE194779A98C353539FE4C611C1287DB4740FC96E00E0F3A246B77687791CD9C6BD6637AA485DAD930F1ACDFE8385D3101E45E6D3F423C8C76685979536B6DB3D1327C53C661D5B5B139C4E1B26B20A618B686CA9B52E46AE2C59A5E6A785BBBB078A8B63588D40CFAD4B47DAB0BBA61D2107CCBC07ABD0BB2306FAB5C7DB4D9B3DA74F2A6411AE6DA8AC8BCAA6098DA81A23A12D5BACDDD082BCDD43157CC14DEC8A25DA269836CE383B139235F56AC622483253D93018323018186DDF53DFD78C37EB84D9E438738E083D2182BA88753600EAEBFAC74F4BDA103EEA687AF78AA87A8E48E95A580E50CA6FE75DA0D7D555FEDB3E8E4F8F1E83588CE1AA958D33E2804C94D46309BE1629241B305868C649E230D1E246DC6B624818220C4DB769C234F944C41D47644978D7606CBE0B0B25C656F7AFC7E4DC132EE3C750B31B4A23860F4F99E9E5E31D7D5D261B0BE47555FDA38ECF4DE3C7101E6DDB8830BF1CF479C7CC4D9717D602347D5DFFA8B9E133BF7ADA0A8EB803C43AF082A04349C4E97007932543BD6C89DD5F536CD1F5393D0DC1667B7DF34BF8E8D1F3A04F1F4AEC96EE829F31DBCEB85325A6347A212157C71F43E853FAA257AEB1DC96C401A0DC06F7831D7DDE4C6396F5D7CDA7C70F9C9ED3F43A5A5FD1E8D219B69B42527012E5ADBA1A768FDF10B3D9F621F9474D760E8637EBDC4D6F8D203C038A9E01D1187274D27E41699AC3908806F7FB70F7EAAB714E00374D17B9E829E045A0FA8922A59E148BF407AFED2FFDDF7DEAC936ED23978FB29665955DB29661DEA6A014F34036458E56A5A07E8F36550EC8DBE7BC08B7C75581E3DBBFC7E7A5B15CBD4AED0A94264CF418E6C55DFA3D4C4E8F7E7EF3F6E7A3D5591C05799390B4CD70F96EBDCF8B741BF4B61429E5E5DB5FAA9497E1667B2256374F9C5951C9F34D0CA4CDAC7408BC5910725EFE259490D321AA5C82F1FD86080191CEFB1BED96A5E2F1F4284ABAC5F2D7B0444675C5F326288A304BBA3B7BC5F3D1AA42707545A747F189B2B541A7378DEC93E8EFFB3062AE001A12EC124F323C1B52501F033174455CBCBB4A36E18FD3A3FF5F137AB7BAFAB77B15AD9F56F5F5A377AB37ABFF30661270AD9B712611C0D829B589961BC83766C68E4CC1851FDC9F64C61546C769E8544E0B33F6704A060CB2576594EA4973FF84A6A00847AB7A15A59B98BE951498E4D493BEAAFEDB114B7E0FB2F5B720FB876DF0E3FF9853AA1F6D6A2851660F9427D1035931DB6943F22132D7D0FCAB35AAA637073A74F3C510E69827DB00E4A0F2F20D7120A9E8E200CEE717F580C83EC7A80FEE469A355361FD06CAC5690876D4FB6E80767831F40DF71B2095A727BC334154BD6875AFEB43EE0593759E4F0F74FA5C9FC6B4C8F8069366D260ADB8B5A243336C95FB06319473734AA54D1AE22609A7FD6EAC8922656F2B9CD1F26B7A6840913F73B1A60E70CD893639D02B10BAA901ED0F7D4F0C7F3AB3CF65E9612A0CE92C7D1063D3597AA0D726B5F440A9CBE662B6956D6A39EDABBDED7F86F8D60DB1EA3573115590B2F58A781A74C53D3843C7014688EE7421AB1839F1254DC3C05981F40A06C09F6FFD4237F128A3EA8D109B87D0D0CFD5D7749A817DFA4D1F86439782D37EED84526EFAB07ED12C9B5456C97307CE51499B3F78564AFD1C429034CB3A4DD2B475DE4B0F8474492E5DC0D8E6B7F4B1C44AE90DF0858AC6DC90DCC0871E02731A38B2280416196FC7A84C0169601CE377D4492632B8B42F7602724136166A443A600249E3484383228CBF1E0B5CE53F9E49B3301CE8B32FD220A1B8D20518C27056453D76BC9FADF79C38EAF236C3A30FBDA3D9A6D17C2C43B609B70D9F60083A926913A6D8BBCEFA5C29869BC3A69ADB19B7DD2D00CDD13FBD6936138B050B4375975B0898EE2670C1547512069308C48C81BEA253F342BE190B1974959DD860B3D4186E8CFB9A2E401073DA343C3CC66950589112F48C1521DF165B1F96D055F73111090F66CB20E79A246E14E06C56842D02A0DA7D9B847CC24A1FDE74215FA50F927EEDD6DAC4F7C2579BC0D28B095CC78BF640A94D66E9C3BEF7E56A6F335BDADB387D524B07129EDCFDE32EF7AF7E212DD171953C9430D26DB737C30E0EC63901A16DD2CEFB8A006F99DDB72B7F0FDCB73FADAEF2720BDEF851DFAD3E568C55BF7DADB96F7FB030E35EF769AFFBB417BA4F73DA2819CCCD9FC79A9BAF5B2C88109B2474417BB52578059ABC9D88500C9E0EB9D361D288BA904137C07E67F02F1633F8D036DED05EB44F59EAFD0E1C96EB93784D4591D18D705985AB3DE2661EC913EAEB60A0CB17EA63EBEC7AE373E42B93AA4012A690B13D1594294C029DA6B111E043F2BB2CE8B5042135A542EDFF87CB230B4AD2404335351248551C9B991D3825273B0455BE942366A6AE2726EC762062FD315F7EAA5363FAC6B137842DFECDBA37772A9370D3DE1D2164D9F4AE44E1185F34F4E05929F56861EB8E880E30C3A527A0F0492E17786F8BCF71E989A00B98473608B0D4903434AB63B5E8F00C3D2FF08068B38B92704822836B9260C41CE21DC9B6AEA7C935A32F545C51ACBCC87DFA4787D9E2591DC889E8EC0C3F2F7137B0EC906E870026991FC181F9835EAEC026C1BDDEBA223BD47A5A4E9E65BBC85B2E40273632C20557553E4A33FBDE3DF0C524712FF0B4782E0338D071D2586C26CC051A7B621A4C7B979D3ED1A53DED3E63A03D092655E0682E2555F6479B99876778349D81C8A49866267ABBDAB5701828B22CD2465F9352513FE8128111C71AC8D2388A44810C87746922290D6992EC2B8F2C45264BE268AA89967FD02A301629E583828A49CA2EE3905BEEF103B504BD6C683452B064D953E84AEB48543EA3B0DD98E489F0005AF378571EA2411248FA81DB126787F359868B57DA342304EED7066BD81F84B4E4FC9CB6D5C49C1024F4D28C2DAEF218C8A0E58A303DE2A763809056C1E46680959085EA1E4F361DD9E94978187926083AA2DAD46992ABC8F3AB2F692C57ECFA57051F17333D1FAD3EEFE322DAC5D1BAE4E9F4E8AD14C5FF3A69FC7CAB26867529C1205F071B59D05534792247B2D1A6601128CCF3FC8F122BE598845965BF06F1795AEDDB4B0A5232EE9B2C4AD6D12E8811A909E5296B309C2DA06F48FC7211EEC2A4B2B3A952B2608996BEACE74418529D20B9D8FDB66886D23B40D851830543C72BA26D01A44E003613AA4DD3214F89EC1B4286710842376C763C1132FDC769618DEC77542C6A9616DFA0BE816203EBE0A3DA6259409AB22B24B2444C1738279EA98A7A7966C7F2D13CBFD1E103CB0BB339B0F4F607666B882978589EA46F2FD892D0247C057958A0BD20A2128E063E0C7FF79D1DF6FE377EB8DF1C1FBF95467C494002FB8A0C1D1AEA7C74D000798C66414A1532EC1E09B7398C6A5F801DCEE1C74954541D4F976DBFF961140CC1024186120F386A8422395EB0557B5361A6BEFE97A388218DD648486982BBB38DB7BF8C8215F2B8C1819D8D300284AD376E6C028008A144EF8150D88648D1AC3A62EC5269ECD96F2F030558A4D625E2A18F16303E128688A52C21E6D7831F7D2426EB12C71D0A1BDABDA5475140D4DE2A1080E14A598A708151A04157D9486A112370E803B5228D33A1119603952E44861FBB54A33996049A39EC4F6BE8B0215096831D28C3CFAB929957C9281A9F15265D382557B81C90863924C4B0C1B2E6D9CF5411C7EE2FC2C7A01C0A2C26BEB50DAADBDBD4415639EC35BF8C820B33EB5211E2DF6C47230792B56B713235329D190B688817A4130EC8389DC31C9D6EF0E733390FC9C89CCAAC7C9DF48B301667300F5F477E21465F870020C6BDB17136D241C7E488219B694880FFD1108337371D5298F8958B3E487DB52CE41DC51082787604F9DC5ABE1004CDB32935C5D00276A5A2736BF16BD7429C6133AC6B36CEB005AC7202C20E6BCD5B06DA0EEA706739AB2384BC83592B9781BC39D7515BECCDBAAAD63BD17BE6BE8DDA056077038972B769B2DB6C36778B94699F8DA062E89268DABCD7B63FC38D6B3440A66FAFD1FC17AEA7F523D95CB666E2C8CDEB5514510286F858F273A7F9D136FF73261B042EFCD512F8D071E1EF481704C519DF89DA8071B1CF41F5E925EED1A435CC35E2A108779998F979D2A7A194A419C074A2541BE732332262044D9A0C1BE6CF44091DF7C1D75271ADDCD30AC5607C4FB8BB3D7C8C5BE0C9C39E7834ACCFBA5DC67AD5C7B02207AC9032AE50D03333E6FB486A145E87C2A39A26EACC35089AB0CA23611E8E4067C8DB1724DCD84260AF896B01420783C81F18D64650C173E64C0F5B659CC3E5592334F5F142F4F6D26D9543D2E596F68B1997533C71EF0D2AC132D75A304BD97DA2513D61AED4BB8703DF59D2229C6AB99853792B00A9B12D96B6655C3630E7D90E7A026855654E907299D1EEA1FB533697C828E7A37D3A36E9386DF8320A720C2E890D099E5C4F48E1E473CA66EF55AD4F0E8DD15F51CC0B8A694F44CD2131EF216867EC096762CA4440B2152F14872C76B1C8A4BB0CC591ED24E11E55E244600157F5B453B038AEA5F031B9EA52F5C7070CC68C89359B427406C1E42A92D2FCCCD8C3B325A2A8648AB010607F3E20DB0BEB3032A4AAACC393A2899C4B7302C85DD69922CA3A455923CCFA2DC526FC186579711114C1430084B3AD6ADD86057C9FE46875D927A0C06E64DCAEBF85DBE0F468F39096C069725908857200797CBBFD0D0645CB4019A86DA018B5F14E91E34D7725940D7785A8CDF6D76DF076FB22CA86FB529A96FB88B05283FD17A89DF6A37E345B2B5FA2DEFE0ED16EA350EA283781E424C2CDCF10DDEA8B9EECF08841223D7C82C8775F893261EF0EC3D2614BA0721A0AE9DB65AEC94B2D32DFA0B6FACFFA56E0BBEF52837031A86DB8A44EC6CDB32759B2CDEFA03CAB4FD4FEA13D52F581006AC6A52C439BF90802BCFB1E11BA21FAE014ADE1B010DC96643D473977413520A5B24A37EAEBDB77C4806D3326F52C0DC7B4120BC327A8C9FE445BDB046B534A8DB01FA16686EF440D39589AB07E1CBEA3DAB12D42990FE20E0E1D47CABADFA6BE306C74F06A681A1F0AEA9968CB5244C0E7ED959910BE436D7345682D36796DE1D6DA6F584BF567038B12CDA3A4B3F24CED4DB496A11D68608E62352856A2ADB98ADF14216B41B56A42B5215D67E1A74E8A15CF6CEDD3AD82CC360D05A59CA66FC5548351A949ED07FAAE042495FC68772B2A3AE85C8208EBE7C3092F2A2731B647A84662848E5DE1EEABFB8B75F0304489242453499292C30CEEBCB0E3E53B8BEC6295944848272A3E8F4224C09192386BDC49BD0811A2E99700D9D152358D3685111F594D49FAE65D30BD87462F1724810E942E88E942FFDB6244C0A7B6013AAEC87DC3B12DBA796A7E871F151D66FD4E75ADE6073F5DEB7C5F48C7A0042DE6CC4107F34C95F617E70E811943809EE9338BF8E8A2EC6F1B3ACB7E73EEB6901803E8B02A7586635725175F5D8DF9D5B97BCAFC0F4067E9F9226C60C9D551791E6B12244FA22791F48165A9328123D17A525A8B124D3B9244B980176F5E1252F878A4466281A3981EAC789098ECD09A4188DEEEA2187911B267098D089B5F3CE141AF3E475598C0C8FAEB9A5E0D4EA1F846EDA2469D8DA8C0C6EF965E2D4DA088C6ED663395F1EE417104CD95C3D4DD6283F8E19D4343FD1DCEEC532E13EA18ACDE1688F1BB090601259B0AA3417821161409ECD428972FD1E2264C125A2846CF53660613538AFE877924F01081BE9C0B13F9611461EC089E43FC42A6E3DA3EAFEFB4F356EB0500DF6F1EC10B3FAF40FAA316BD4490D058A39CEE4C2B1483E7F4EC652CFC4CC721FA15EF0994EE8535FE40E667C2F90EFDDA153750946AF3881E5BD2EC895186401294F8E9850E851CF2C740F49A78412421914462257EF1E68AB285A1F014A2D61F1C1BC6A8E10402761CEBE0418AD224148A9B2A41C92E09E94B5234FA881CD041A859180F8FCBA8EE2A99404BBD2AF81517AE240C834C8CB0E4CD2D36308201B6EB53463AB073FAC83B25F166F3B0631ABE78EE36EAA4D63EE277DEE84DD765DA2B7485923778BE0E2A5BF81E37A758C5220415AED8577ABB74A57C10AD858DFA2DB08F2E2D621291DFEA1A0A8CFAEA971382FC18A39600FBF3A422AC9EAA5744FA77A7FDB7F727CDFDE9F687F2CF92BBE029FC9C6EC238AF7F7D7FF2655FD6DE86CD5F17611E3D0D24DE973493E64DC140B42B73953CA6DDEB5C81A3AE48F7B97B291316C1262882B3AC881E8375517E5E97E350DF74FB6B10EFCB2297DB877073955CEF8BDDBE28BB1C6E1F624E18D5B35D55FBEF4F249EDF5FEFAABF721F5D28D98CCA2E84D7C9877D146F7ABE3F06B1E808C14854EF817F0DCBDF9BB12CB24A253DF7947E4BC513008C502BBEFE19F35DB8DDC525B1FC3AB90D7E0F6D78FB9A879FC2A760FD5CFEFE7BB4A98EC63122FA81E0C5FEFE220A2AAF53DED218EA977F9618DE6C7FFCF3FF00A2681B0D047D0200 , N'6.4.4')

