﻿ALTER TABLE [dbo].[Locations] ADD [ICAO] [nvarchar](max)
ALTER TABLE [dbo].[Locations] ADD [Country] [nvarchar](max)
ALTER TABLE [dbo].[Locations] ADD [CreatedTimestamp] [datetime] NOT NULL DEFAULT '1900-01-01T00:00:00.000'
ALTER TABLE [dbo].[Locations] ADD [CreatedBy] [nvarchar](max)
ALTER TABLE [dbo].[Locations] ADD [LastUpdatedTimestamp] [datetime] NOT NULL DEFAULT '1900-01-01T00:00:00.000'
ALTER TABLE [dbo].[Locations] ADD [LastUpdatedBy] [nvarchar](max)
ALTER TABLE [dbo].[Planes] ADD [CreatedTimestamp] [datetime] NOT NULL DEFAULT '1900-01-01T00:00:00.000'
ALTER TABLE [dbo].[Planes] ADD [CreatedBy] [nvarchar](max)
ALTER TABLE [dbo].[Planes] ADD [LastUpdatedTimestamp] [datetime] NOT NULL DEFAULT '1900-01-01T00:00:00.000'
ALTER TABLE [dbo].[Planes] ADD [LastUpdatedBy] [nvarchar](max)
INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
VALUES (N'201504261816506_Location-ICAO-Country-And-Timestamp-On-Plane-and-Location', N'FlightJournal.Web.Migrations.FlightContext.Configuration',  0x1F8B0800000000000400ED3DDB72DCBA91EF5B957F989AA7DD2D4723F9BC242E29295BB2CF2AC7B65C1E39BB6F2A8A03492C73C809C971A44AED97EDC37ED2FEC282775C1A4083042FE34CE94543128D06D0E87B03FFF73FFF7BFEE7E76DB8F841923488A38BE5D9C9E97241223FDE04D1E3C5729F3DFCFE0FCB3FFFE977FF72FE7EB37D5EFCB5FEEE97FC3BDA324A2F964F59B67BB35AA5FE13D97AE9C936F093388D1FB2133FDEAEBC4DBC7A7D7AFAC7D5D9D98A50104B0A6BB138FFBA8FB2604B8A1FF4E7651CF96497EDBDF053BC21615A3DA76FD605D4C5676F4BD29DE7938BE58730787CCAFE12EF93C80B4FFE93DC9F946D968BB761E0517CD6247C582EBC288A332FA3D8BEF996927596C4D1E37A471F78E1EDCB8ED0EF1EBC3025D528DEB49F630774FA3A1FD0AA6D5883F2F769166F2D019EFD52CDD04A6CDE699E97CD0CD2397C4FE73A7BC9475DCCE3C5F232DCDF2F1762476F2EC324FF483DC52779C3570BE9F5AB863028FDE47FAF1697FB30DB27E42222FB2CF1C2578B2FFBFB30F07F232FB7F177125D44FB306491A468D277DC03FAE84B12EF4892BD7C250F0CEAD79BE562C5B75D898D9BA642BB7280D751F6CBEBE5E23345C2BB0F49430BCC64ACB33821BF9288245E46365FBC2C23095DCAEB0D296653C240E86FFD142759FE6FDD25A540BAA5968B4FDEF347123D664F174BFAEF72F12178269BFA4985C6B728A03B9036CA923D31F5344A271F63BF9816F314EAE1506249836C787C2943C93C3FBB8E1EE2645B6D23D75D7EF67E048F056CC5642D175F4958FC973E05BB9231155BE8AEFDE243126FBFC66145A1CD8BBB35DD5D7E3E4F31F4F6D64B1E4986C7E84B10C6590AE253BCBA2B39428B4CFBB4E9ABC6847955236985C69A6EB07D5AF0603542ED47306AC27B1849F1235B7469FB245323DABC9650E4DF48C809AF21B4CE572DD3D6B2F296923AB0F3BAF1B42C9DE52DB66C1DCF97DCB1F65118EEF5E5DB9B11B82455C39297E1FB49483ED3B754E34B336FBBAB3BBCA24FF387D662A402F86E78D43F7A69F66DB7718B3E03D4F910D09CA360919DD846D1725A9E51A0D08561340D0F8C5B5852186DCD32C5C1B6C727B2BD27C9181DC5F741F8799FF736785FEFB75E100ECF1451168981B8E21174E9F7CF4196B33A99ED6115A9523FEAA27C8A6A30A097629128D9D57F0494DD252F77EF48E685945B8168959F56CC4C68C122AAFB4ED2FAB41FDBAAA6FC608A5979E7F9DF532A162D86C4B5330E8CFB1A373CBE898341DA0E0E37288BC1741C840E6F15A65ADCFA6173D72EBA012D3575A0E8C10905A4EDDE5363ABDC9E860DD9790B3226A686B7715F892C8E79A9E074EC1710C3436B7B10457752FE2040D3EA8265DFB23208FB0F4BCBC15E716C7B2927E8D77DB0E96AB7F43620728A185EF0C342DF12D52BB2F3927CDD8DEA836424459B625C9D9A15A66D3FE5EA4BE845A4AF8686B43710406A262A0133924AE96CEA8B44C527FB8229F0219B9C15F605952F35D9DCC8CE1F7DB35BCF7F8A65B28C2937327659B4152913D5F28AA47E12EC867145ABFD0BB3F655E8C4AB59E4F7D4CF45818B52E6D121808A34F1E8B72D0CF8D71FE206D07CDD2964308CB68D429C577EADB04628B70E0D21FC68245D193DAA5C12598CA6FCDC348AFC2B24F6C5A7B658339C1E8F3BD7C83002E65BDC38D8069D4693733FCBB1944D3023292242F871149FF7B2092A3AE9E201CE5B4EEC01AEB5336B0F304EAD73E701FE4A1EE9BA25AEA2D0B62647BCDD118AA62B7FB0ADBA375A1E44B9D1C61E5FB12146F0157B693A782F377F8F46F0AE8FE2B35E978ED03ED6C5FBE83188485F2058DF39DA6A3B465A0FC17AB9220F1E157C7AA5A154ABE44F193721F885EC2B843FEB1621D1BBAA61D552D010451F30A76976525598D9E9A0AE34ADA75559B84D6DABB658F8718E598C2A6606855C7B0731D17960E2B655A489F5F0EFF7F0E8CFD3873F925FFEE8E93E7ABA8F2EEA5B2FFD7E454D552FF22DFB1CD3B9ED320E7119A79938524B3825FF7100A8583707700EC8F92F394AFC38D950866FB9B23D620888B401D82337646440130B3079FFBBFBFB73B31C56FDF33777B57ED122C43C96147FF65DA7BC8AEEE9328A7919369C60992BA3C371B02081C17653E134A0EB5FEFEC47B8F70777E8EB5CF846A7BD2B377DE930EBA0D8E70DA755EB730CBA28F575BBB1ECDCCACB751339300206D4840C9E9BAEDC5B245F88B3772F3168ABB0BA171BB4306650765022D3B9F8A06D7E602508F3310186F1E3742A3C04D33655D589DD37D1C7F8F17D59AAD5750BD51066B081282A41D7DD53B5EDE1EBF948D274041A9D9D20E0A8009008D07B98BCC58FDCA516F1E025451F786DC050ADF6ABF6DF5B4A1D7E5020C6308CB6629B1FE3FB68B3D0966F970B5F177ED3B5A71B2BD8D1AD44BBBE58FEBB34692A808D85D5026C4B7F79A0674B711FDE445724241959BCF5CB03292EBDD4F736325DD139D9F04FE8D625492E66BCF0922E1565064194C9FB3C88FC60E7853AD48546207B509702E7C835DD886FAEC88E44B930D4AD45FFFE9B6E844933CDD1F98A212A3DAD3105512ABA80AAA35AA2A8F60C9ECCA04A7F3DD14E4F5F32CE98C5858F0EB1222C79EEFB753C02456973655544814B9C6DC904AE2EC11321AE90CE40E56752079D880B830B66D51525CA56F48659070C2E8CCF7C3E44D87839ADA84276800E4C8692471521824F4F4E86A44611A511452B6A4D50F83091B1F9D064C958ACE843504307A646A126744296C861322943E456A0272693125E1340B0270939B6300621CAD5BF06821C983182484D4F9BE2E2A03162332126A15521B7494521AA44A7961A98400A9EF054E768E9ED13773406F73F92AD01CFE9ECED0D4552ABD2FC3464B832FCA40C5F5A58B6FAAC580C71BA23253D329855D5648FDAD9B0DA197780C968221469C69A0D577B6138AD713AAD397AB80628D6E44418991D48660E86E4F4A6E3611A8B6C145DB5CC6048BD5DE2328D034F35607E95890C657AB1DF24181BD864F576D81E135AB653DAB28769BD5AD9AB580BB52BD14C6E85CEC1EE3C744B934B5234AD3A9FB1E8828EF8FA3583D5317D040C421BB5D670D57C277A6317A167DFE3D1179B726AA00930FFD401AD4149AB0711D657E33FBE16092C0EDA746D4B7B26A744AD6F449D67EC8A0AAD1D22F322C2A95C28AA853924E7097866909E66F407080D1D6F384809AD1BC4B8F25AB7788722BD35674559D1124AB23BA6DF0397FAE6D18CAE039817F5B03402E5E961F674A6D71686A0EC83D5244C83195FAF302DE86168196035858AAEF4A5158237872D28B2CC73555E1B355644598705665D5DE5B02AE6BA1F0AA3E547B387AA6BD71B3E61BD77B634742A3B9E4A7BF9E8C12A0E2DB6CA920E01E1B6C4C8723A54E520462BD5D52CE80316DAA211E773601BC570250495935756B914F72106114984532BA28C3C43A7067D4B49555796562548E2F073A86B92314C215D2EDA921A8E9B4A73C737AEB5420840AB171B80D4D7834810AA893734E7442F0406569D4C48E54613885469B41A9AB317104A2018CD0A3536F5A08C00AAB321A4E6654813B330DCA58FF012B10C1303B2DA72811A62BB9B0578CC56E14998B99893F986A165451D18C710E04AB0660CCD669104A8A9F68B01C16C19912FF083430C9CA9390246ADAA4802C422A7B531C8D65B533360A00AC934611D46AAAD8501C68EAF9D315B49621212333C91F768E6095528639C7A5753D79E53839C3B38FFC63C42291FC7E1EC496939036D334DBD0176FA004507E138E5341E8713C7AB3AA3119D70D48ECDD4C1F90AC8914AF90BAEA7524A6318624AC5C32AE5E9D3A57C732351247D3358B3FA8B664A1469DE030800D589BB80D843A431F3124C9FC8CCAE65A514EAC4A13E751935C59DF79B5922A265A059EA6136CB88020E21D2F0420C21B650C31F4B42714705C9C357E64072384359900CBE9529A1193494F7689EB7EE2B6E10C148A16B12B3A8851E4BA26265A8A5D4C4CA49FC5C8C2212B9CC33CD5CC81172106F2E2ADE71EC5CACDB283ABA8F993B804F3972659C15C21D8AAD769B0528623AA86E7EA7D508F4693BCA01A8B400DB8918510180AF93C22ADAA86DA24D2571A9588FB49374B7582127CE669721F2191C4EE2E81B517D8F96CD5CA236A9317AEE7A1E47D9C7F051760AE79E36488B0FD38AA29973F99A5C7FAAC0EC1036A01442547A3D95714664A4B18B0F148A2D5A4C6DD709910E8653CC8936F4880F3E8A23629DF9A62952C51B073112C013E94C736332197421492733E3CE90A88FC96B0288CDBBF3D5DA7F225BAF7A70BEA29FF86497EDBDB03C77B27EF1C9DBED82E8316D5B564F16EB9DE7E7D18EDFAF978BE76D18A517CBA72CDBBD59ADD202747AB20DFC244EE387ECC48FB72B6F13AF5E9F9EFE717576B6DA9630563EB735C57067D31365C0DE2311DEE6B7E36DC8872049F34BBABC7B2F3F79F172B3953EE3C3A58AE054DD171B119517AC0E54D55FE7FFB3B20F38BF13E2CAED2C7EA003DBE6E91DC529B102C3949BD1866BDF0BBD4471A6EA651CEEB7913ED5430D85B9308805C43CC6C392C1D84260D30D5938BA34443534BA2269900928350FF1700ABAF2B3EBE8214EB655B4919B75E0BD0CFD7C25ACBF486A2B89D6A404029E705164DD2A7B4E485B154E4590B7BAE938E4D09F3CAF2FDFDEF010CA2736A4B42F03DC3CFDECA1A8B7168E746D2007507A6B0DF99D8863FBD8623B833704722B097ED1A9071163E1D56C366425D19DEC46506F416C45453BD52C3745AFECFC2A2B61D570FAEFC06F11C00E9A8778389FC8F6BE3CDD8205D43EB58014DF07E1E77DDE5000C6BEC0C37BBFF5829087543DB2D8C34E54833259885B2D207D483B96E632556E38CDD3D9EC49C151E0646F82F967F65B150746B502656B9116DAA7D67201940A560A67261144F5080F43A629153D2921B457B57160DAC73632A8BABA8D973ED5436B38D5F58000B0EA0D1E625302C6F16D555D98068E23FE2F1D5C20C1D39D6AA0A5A9B67842A02C7555851A1E73F8110B4D73269201B7B65C49C24E5DC9A4A794FA741D914E54A7EEA8A1897717B210C5779650C1ADC1BFB1D9B3CC050DFCAE655E74D21D959AE3CFAE8B96411537BA281447C2E8A270BBA179DA57F218E4952D3239F16F6C6CBBED8ED061011AAAF06A1AF74C1990E1762290BBAD8350ACB4A8E5168F6C74532F4D45D5B478848771F3F748D4B6AB47636AB76B2AA78491548F2C34E4E83128C29A9C825C3F1C52D31E4B961E3D15072B1D9808A71309A10CF222A484A6ED58943C2F57B99D8D3FA95DEDD4A0EE6C424F61341F0D551CC4A3A1DA91251D8D4B47C6E5AD977EBFA26ABF17F91296EC9BE9CC55E74E89F2EA7A8966CAC7785875A85D04C63EB75C591918F3F8300D7CB519EAC7C9E63722C0631ECF46989795004E4479616AD90B72B899CEC213770B7CBFB50E0A73D3346065DC586DE1AE2C61CA48259BBAE62E66C9D48E778C5EEA2068C5FABAB9CE5912EAEDAB313579D782E2202C033155CE1D6935870874242C757B2D5955F71C4B3405DE9DAC83565F77CC8997EAD9E1B31A3E6F5116304D3A2B528A34DF6364459E7E090809212F559E136B2BF14E6D2C16E7C0D4A0ECF0539EF9D45BFC6991BA8CA9365D9CE5739DE6577737575E5B8C5B4C58B5A60D20091CCB10F856A85418602194C9DEC8E5C0C99E3B831CB2A41E65A6BB0DD2687BBA3F15A167C20D3D4939F4B63246C97DB49244B5508A3CF959F1235D91800D51598A4B35968E29A12A18B02684AA9D5B3AE0AA027A6FD9BB6E1B1787E4BC49402A8A103F69D49EEA49F3BB298AA80A12B84A89627879DD4331ACB42A8E102B14CA4F960B8AFB8F60935727AC5FD28C6C4FF20F4ED67F0B2FC380E4FED2FA834F5E143C9034BB8DBF93E862F9FAF4ECF572F1360CBCB42C5EA96A2FDE8887C0A18A31CE7EC98B31C866BB129BDB9774E450D2741302051DF90662EC11A104E337229119F6DCCAF395D8F85C61FF94A78B0551BD2D7F2574E173A3FD8B976524A1D3759D9F7D49915D2E7289E4DDE7753995545A69BB60623E652FD10F2FF19FBCE45FB7DEF3BFB1E08AA3F80CD09C0162F3E299D14B87055E471BF27CB1FC47D1ECCDE2FABFEEDA96AF163709A5C1378BD3C57F5BCF4B535CE160305055853558D65CD112295C9C8023547539829958154BE69A609D915859F0E06479ABA20717B0A42C821268EE8FCD827CE496D3C5E410B8D89660EA404F14058FF3703B03309070DB42A16E98F744D370EA0D8182D4541F38A094B600C10530B600C101BCAA0CC1C57E952534424695AD7AC9A732C5CBC55C349955EA6D8C81A33178ED26470948355F3D3882B92401C720344629A00DC2A506666ED2F652CEE83E0AFEB62741C1381E827C6F74130EBD397855F6E0801A4D9488428709C4F7A3E926FAEE044C954BC2EC06CB71356924961BAA6CD68BDD40820CBB975D74CD26A97440A16D8E67222099B7A92D7658304D7B4D069323618740D3B057F7422A4E8739A81BF742834DE0B1B40E9B967D08414CF729717808632FEB044AE0339D0071D130B7AAFE0169F8C05572380D1FCED04368F8004F76ADE1F3651C2E347DA18AC30548B78EA4B29EC3055E555987135DBF28EE7000A92AF170E17073650654F51EDD9593A6D4A3070847A6C8B072FAE8C631021D96C9AB6EA743317A4D7AB299D9AB08EB9FC4293F84B3A3B7F1EED25C9FC0043F1ABC4783F768F01A50385A9C73B438F972921999AE73709294151E8A49418161AB4EFAC0610A4EFA8099933F0032919B2A13ACB841EB1972FE2D4ECB805354CD3A46DD6E400593A9F9E8AD7AB8DDBB52969F4ACF426C6701D6002AA8B67EC322B6AC4E0E454598C150DB6C132F5C93CCCCCC124DA2A4054580A9834872A8DA3AB250EA8A8D19AEFC04CC02AFC1DFF531213A18122A0295AF30D6DC26CA1CEBDDDE475AE22FDC893BD46DC21C0EE5E5014CFFD015E9F20DC99DEE47D79C076C9328B7B0B9105D71BCB66D7FA3DD7E0E24C05A2ED64084C224BBDBDDAFDE8954D0CBA6BEB01E4D22AA83716D3A1B813EC05B47C0BBFAEC57ED4C5A35FD6D27C0FDEFE2078390057EA934F50B68C2409ECA2A77AE3967613A52816F36EC2A8E4E4F4E0E8568A6103B9D49477772CA74B403E5F51E99CCB44C46D3F9A46402DF28694F2E07C4610E89627487518D4239BA2BA86D755D038D3077CB318098A707AFBBEA8E499C99FE8AB974BBFBDA1928A1BAE692E539E5934128C06E55B4E7B9D9D8318A4395AD7B1C4D7C8C67BE0092E12792050764944C61868CB7F8D3991A87615C286F99EFB26686B56713379B2BEE075A778B35D09DAE815E73C59978AADEB4477A8CB7F547B2228FBC7E16B6E104D6E071E56762E3D51400148B58EBE403C53346A718B476AE3CCB7A208A5177371EA5307984B30E971E154AD990541F1C3E3A05B9F428FC2414348D2FC2968666E08C107DD9B3975D33F17D4F20D7BAF8BE6720E5040A3B2C99370F6A3BA858EE7CA423447907232BE7417953CAD1AEB437A9541532B7878FF689A9E2924F817D77F0913FF3D508738BFF49E76B0FB0901812192D89B1CB1219CFF41E20ADD1EA4CF1B128453C36BBB73D65A48BA6A240A28FF6CD4F113D305D7D31D73002748A76CF9D3E64B2F464F434AE73DA9E9A8C278C3BA7A5F7FC89DEB538144FDF96A8A93A9B9D119FCB455B03C2A92AE5C9DD17CBCD7D4C17BCAC21C9DF4857F34A605B734E02DDBE82C0D76FCD5D54B42FC1AF4FA2078017AFCC90610D5CEA08FE0CEA17FED234BED2F9228FAF7C0E8EAFBCCEDC0499317924E8CC3BA807E64A5CDC2C2AE74D375366E065DC5B025D3E86009797B7A1688AD5C460EA62BF50D2197B7118AADF9683C2BDB6EF957D32174A895DF2570480355D0BE61B860F288ABE143E9D6668EC43891D8A5612D3AA7C200A261E7DC4D098D223605CAAC2247BD42009CD34A99EF41E8EB652061820BEB2A6CB00101E0D06048AFD399A9226150B3B2770EE9623E29ED5D4542B899C1750E1FA9928854FE5B09A163801E460A747C85E07A64297DFDE93654ACA8870DDBD034900276943520191CEDD07799E4258FDAEA490F2892372374B8741E50140B8EE8666E6F263F0F56186C8DDEA280F4F996EDA0D41AE15AB55B797483A5B3583001A50E40C4A8C48413282E81876982577520F0F0A9ADBF3BBB187C546ACD58353C6B50F80A148C94486610E28F3861F2698F18256EE0623E199E8BC2862C7A674FC8C36126293E0F20E1C6F99F1A7070C75AB3C29DA90B80B9F8AEC936B0523FBCE91DB888DE82ABD47CAB0AF2BF447722D81A149D5A8B5214C072A28E80905AE92753D6CA56E6A0CD0F5D6DDDC0F59BAEEB57977BE2A7DC7D503FA53BAD6F57CF5751FE5A73A96BFAE481A3CB620F27BAC23E273C1A8E69BFCAECA3A342660547F22DEB3402DD08D97796F932C78F0FC8CBEF6499A1687CCFED50BF724BF76ED9E6CAEA39B7DB6DB6774C8647B1F729391C7D674FD9FAF249CCF6F8AE3E4521743A06806F9419837D1BB7D106E1ABC3F0087AD2940E441BBEACCC57C2DF34B3BC8E34B03E9732CEA182A40D5F435B1C65BB2DD8514587A13ADBD1FA40B6EDF52F2913C7AFECB97EA765E3510F342F0D37E7E15788F89B74D2B186D7BFA93D2F066FBFCA7FF07BAEE99ACF23B0100 , N'6.1.2-31219')

