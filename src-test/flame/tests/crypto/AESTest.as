////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2012 Ruben Buniatyan. All rights reserved.
//
//  This source is subject to the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flame.tests.crypto
{
	import flame.crypto.AES;
	import flame.crypto.CipherMode;
	import flame.crypto.ICryptoTransform;
	import flame.crypto.PaddingMode;
	import flame.utils.ByteArrayUtil;
	import flame.utils.Convert;
	
	import flash.utils.ByteArray;
	
	import mx.utils.StringUtil;
	
	import org.flexunit.Assert;

	[TestCase(order=9)]
	public final class AESTest
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private var _aes:AES = new AES();
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function AESTest()
		{
			super();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		[Test(order=20)]
		public function testBlockDecryptionWithCBCAndPKCS7():void
		{
			_aes.iv = ByteArrayUtil.fromHexString("00000000000000000000000000000000");
			_aes.key = ByteArrayUtil.fromHexString("984CA75F4EE8D706F46C2D98C0BF4A45F5B00D791C2DFEB191B5ED8E420FD627");
			_aes.mode = CipherMode.CBC;
			_aes.padding = PaddingMode.PKCS7;
			
			var cipher:ByteArray = ByteArrayUtil.fromHexString("1ADF171F7316370DE4FDB0422B665895255FA79B4ED71D12FF2D581EF3A10454A34A2D7D113807B702183B72BFA680CE426CBBD9FE54B6FCCAB4FE7A8FCE8089C0E1545AB66CE721BC4DEDBD6830413FD6DDE830AAD73C46717C6F873F4EF43115469DB05F22A1E05CEEA82B6BE0C9C183C01D43B046E611162847D85223C7BDF521D7D39D5ADC30A7B17800F8499D89BD4F5C8E074299FA587AE61CA2374F592A8D4A93141754B32B6CCF40DF399A32AD4068C5842858C925D50D0BD0E864D0B03EEBF5018999F5F219713CE758B3B5CBC34122B93BF2FD77DD7890E5ABC6E736590657AC2D37DA8B84C4AD761A57E5F1E43F582279564436303BE6F6AFF4C6857A1C4EDC6E520DFE7BFB97CE7BC76D3F7C7997870926B8281BE43A0A05297E1504B7209D3DE397F5AA035C93B896A7DA869C785EEEF540B7731D044C816F9D2DA590D2C155A14C746CABFC30FB037BD31E87634AC9A61F2A26B2FA6208CA87425DD86502D1158BF6B00AF9450C46BCECCE9F3801AB9E1544C8440C8F73C73BC8CA2FE1F9DAE69F04EAAB77C12675396D5CA5ED3C3C2CEE6311B441F954DF0C02C18C7B83D19BA2AEEA757221BA90AB055525AE4B16DD69454B2045973A5FBAA91A1E1205E42B2225AD57A90944FBEAE1FD6B9D15993118DB22DEC4D8B265D904FF88C6B9F1910327C4DC11DAC96E7B9F0D8BDA635D9D1515693D71D037326D44CD5726EB33D1DF82A488F22A9CD6021CF3F703F2D269835987D6161BAA4F33C0EBB85DF0BECE89C074AFB6E3B6CDB2C19F0DA4E075FF18F12BEB62D837F804F6C5AA306CF3C6358ADEA047190070D2F09EEB283D9643132D1E9C349AE7C9034F7F02A5574D07230FDCA805C6BD45C9D8B675FB5A3D8F94DDDCEA506684DFC21DC10AA3872E08CD58351B16A71D91450E4A3E8442AED5FCB8C3DEC3939A4A0E73C621393C9CA5F36F0D7B4DEB16D332D905E7D66E16727989B51DCAAED3D53FCBAB70C1BF318E2D9880443721B3ABA77E307F9C659B47FFC02421171254868FFD9F75F2675C9387749E128F528E6A805834F317765E47E647947D99ADBC17CFBA7D6AC414B4E5BC92CC7E854F5AE7CAA1FF7330CB6A1581632AB5A06C4FDBAD9B237766C6D90B95F9B51316CFAE1C6F2AC7108BC05DD82716274E2113ECDACD8348E1E21B59A78890DC4EB9BE20A8F13B221E35C56D6EF4CF789597DC3CD6992C03685E64EB1B436F2F949C5BE46A6F9C012AE7E0E1BE26947C9A8DA948669C3B57B2515FE008AE9CDA2916716EA6201A6D37998A71098A381E81D1617EDE57E73FCC4CF4CAF5CCF37FF8E8767745C4A26AAB66A2EFC37283562C4D6784D5968DF3CDA67D7E69A3146021C1806DC3EB5891E5892B44B58763961C2F905EE33212D1DDD11C7990640F9DDCD9B0B736E226A92E60CEA46E5268B4D8F05402DA2B46DD747E0674D9B131D52EC2F67FB917DA3851AAAFC116673A2271122822D4AB8CD43D0D7333D0D089A7D4B591682C8E880B2DF04B7693BB0604761AA956120435FD1927424CF4371E30099D7A4889A49CAD59D0D29113803D040C4F3983A6BC3D8FDE2F4BA28B27D8D91869061F8306D4C2713A1CE1283AB6AAEC6DECC956105D2F6FEE1615B4D14782B5FE2AF8B7EA404988F1EB3318A7193B1C2C4E4859D5806D430B526931B4494EF547F513BBFB077F8483069F3BB8E2589AAAD945F79513A9920C3E7F1CFF3194A18755D692E605526F4058B26966AFAF3243D4EF0DABDB7B3852B1DA32AB143044245E97BF74962124C80898F2E566441F5CEB6F5724E6181B801623AFB69161407C6D98C6618A398A97FD7BBA22E3DAB38AA9374A295085177009CEB07413AB8B5889E72A6234AC989863E29D7760FBEA708A5C8E22E8C22FA421D8E5172D55D62AFFEC46108090577477ABDADF462661E51EA634740E16F0F62D591ADBAC688101245E23F0782F6613DC26EC668D26E7B1699DE856160BDF8EABE092A1123D749902F70DAA8EA17769BB3BFAE77C1F3254ED940F7C2ED24E7367AA405F2444D3D56ECC18E197556F00070F72837C687514CA6940A256514B854B09F29ABC50C76C82FEDD62FB8F6C73943ED75505625E3CA8A995945B6AFB5ADAE6CA9D425F35A3A037F99DDBE2EA59372257FAD190FC8D5AADCCE230D51E6F6E4991B3E93ACCDF14630743762DC9BF93253FE1FA62F7AF98CD3738727DDD05E452207F6C96C922B7FD1FEA39F6747934250BBDD23D8B82E722D825778418805BAC5C59303ACE7996C9B7C767F9A34A3D36CB6CE81E2A150DABC3684EC262D89DF30505502E87D118EA431A7DA998E1B26EFFCFC36BA6FC129868E9A4335E6D6A88249213C13464FFE2B3ACBD478D2D09E31EAA4D126B0DA2BFC84BCFF75F4BCF862877BAFBECEE61DFD1DBEE09250B45B9B1A4C63A87ABBB3E20A3579A72535B298285DFAF7D6C9BC322A5C264860F3F283B8D1F490F24A443D02B23280D03D790F4E6C750757D67D4FA204323311E3874674EDD5A65AA958A93E5B9C5C73E63FB15835E7C7D19F9CE2A58769C4081DDAC6CFD9EC8234622A8870F2E7087BE1585F9D64A0173843F2AF876A5F37309FEBBDB6EBAA67D051B4D090DE63BFDDAC6245122228CA473F7BACBE0BBCB5EC45112D0692D3C9C74EA9A11B21CD7224E4C6A2223FEA1E7184A0BD0D16CE4CEC0B744D3F2523D61B4517B2E8A9447FC2B08AA6AD924DB2404A27D34FEE1AC564C83659211159DE4BE1914D845D5C796A812052244337BC705795A54A60DDE5980B7933951E06FCEEE0A3D06BAADBA086B248A5FAE876BE1869A33EDA9854AFA7EF06F5AA775929A37287B3549");
			var data:ByteArray = new ByteArray();
			var decryptor:ICryptoTransform = _aes.createDecryptor();
			var inputBlockSize:int = decryptor.inputBlockSize;
			var inputOffset:int;
			var outputOffset:int;
			
			for (inputOffset = 0, outputOffset = 0; cipher.length - outputOffset > inputBlockSize; inputOffset += inputBlockSize)
				outputOffset += decryptor.transformBlock(cipher, inputOffset, decryptor.inputBlockSize, data, outputOffset);
			
			data.writeBytes(decryptor.transformFinalBlock(cipher, inputOffset, cipher.length - inputOffset));
			
			assertDataIsValid(ByteArrayUtil.toHexString(data), "19A2CC4C0D1CCAD38B59E5946B5EF8792CA525B057CEAD780BD877CD353E396101CE6ACCD442DF091ACB30EA0A5A86F97CA96BB290293624CD51F89B4A460339A04FD70CED3824663BD1F51E26A8D5C057B1B2E27A84AEFAC08FCECA0ACE1B567FC4B584063314D0446A3DEE8CF0F5619D1FFF3B30B4A0B380284A733643C4971466B3EE14A1EFD558C84463988D3BFA0BA66884158F53608ABCF5EDB0A3AFCDE0D15E36F5A965369461C3EA9D818B40E72821B25873239BA4CFFD8043EAABAB11FBBDAD3E67DD05E3459A131C6BDA12365260E09FAB233C01971DE51F371DAD156E990ABEE716C38D0E101C1A44105C01593232B66A06BCC372F2F2902FD669EAB1354E91D1B5401E6897A7F7D64DD84C86AEC75307E03EEA312B509AB0E76CF4C0D5A513FC3CB83F2A2C1CFC50FC9DE6572A4386A4695BAEA38F3D5F12CC70161B1D045E524344DED28C9603194D131DF0D6DA7734605E1E74D6960C3A123FBFC7C9B88EF8670E1B791FFAD9794248BE94071DA9C1526FF8B2049FF1F52393F7F98BD3E4EBCDAE2AB90393B61288A17746419A158E7F8B1FC17237095EF1A8706A6CF2E80CF0C5DC9CB688476D3AF2DB3A1401AB98888AF0714B4350A7EEE2BF7E6DA452D729E66B8050E8E58AE909F4A258AC6B621460391FB58423B7A2D76B7D3F9BD5A4A02D2E32CB7EF0D0CB16A6945E2D705E37BE87A9559F027F9B96CEB3680E48F9AEA84174FFD31745497CD317ED61A47A410228CEDAAC9FAF6B8BE0907444B237CB4B7BED143E0F5D24ACA7B8128852AE0427813428B8D1B0FE4FAA879DD7BA2435B647A04373FCFECD74044F9D1BA2B42BC15292EA54E0AC24D97482C8EF1A5190CDA01DEBF5582F8EB5464DFE7A5AFAFB4B87010A3A7478439F3A4EE051836C9E058163515A622D23D2E816B0E7A23913CED499EC66E316C2D260EBA30D593F522959303ED28EF7DE07270F6E6AAB23C804AEDD0EBB90FD2E361B1ABDCC05DE14839E45827CC4E409D6A02A65F6695863A4F699631B260A50465E02582306726142B611849A90746417EB141A2A1A5B25A4EC58B4052B1362D914D736CF53C11F6A579C08F3D50FF9C7E44012D10D559A45382EEA529AA6F849ACF9D8D4C26E552E38266DE8FB463926FE3402757A2A481CE5FE514FA63339FEE1892E55EB4A4DB7701CA00601E9813C47FA662522D7D976D4FDDADB44B597A9CD1A4C9ABCD92E4BC22D595885656D635190783534C751AEE1E535F3D171067CFA905C7373C1E9859E9AF4A3930566670459320269956D9F30442832D8B3C404F7B6A8D1D5240F047DF41941D2014C5E3A96863507ED7AE73EC73196B0A27C564E09A3B168FAA66BBC80D434D56BF6604FD3920D64A6511DC74A8CBE8CAE9EA5417BC3118FC86F1A4C8E32E2FCE0126230A07E6A87BC83D4E1CAEA3A4CDCAA12489475A1501756BF631B78BC1F08682F30ECFD0EACDF69BBE7BE0EBF884672336F2491DEF5160A6424A21C46588F0BA7B2CC580519F07D56C0564E36D156E870C61F7A4633B18AECE5025A97CA72D11F727DC260AC4ED5354A7D7995EB31C2D2AE09F69A2470695E798A297827E5798ADD10187BB728EC2F7FFFD5497735D8F58F8807597EAE785A44BD4DFCB30FFF9C5D8EA627C7B0BE59B7C93E1EB50CB9E3AE665BCE47147703167D3B99B959A51001D66860697B0312FD42AA88396998C84A64307650D4C808B9D3D5C42042A0E5E485F8F05F737CA382F6BD1D9A189776FB504477AD91C1AD64309785BBBA1AED7A1294A83CB491DD4FE4120D630685F2165B8E6DAF7C082D86D976035D202F1544A772E6CB1482BBB8AFCFF4F6913D0B2EFE27D4D212FB2084A88B4C4DED9240FA0CF6BA6089BD1E57AF7FE956A36A4F90D74E379A6B3C740808651B6603A125C013EEE6C7D67FBDF60C667044FFB5BFD10FB2956803F1FCF24251A7FEA4BD01584B459F5934AC55B478453DA86F4F3D03E850F10E44E9CECD79593A48BF0E4CE6343623F583283E814A669F072224B7292997F1B0AB13B9CE568B81B1F5E48888961C018E7E98B78CD76F7A8FC149F2D240B1FA669BE276F9794FFA6B9BBDAB9F34C22F6AA2CC47A128FD18BA9715EB8532DF26D0A72224E96EFBDD49E68631CCAE5FC581B0EAA98C2D9AFF0C9120E5DB60D4EFE7E2AA0C967FC8790B71869AD0FC5E3F4304270B33C30D0D8879B968A615C0FB4906283E41817292DA329B73518AC52E35E239FB5A314A275CB2263D3215767EE5CB46EED75A016B0AA90576AF1206FA1EDCA5176F2F27FE75774BD5EEBD3E8E50EE872C1CE76F8738470FBC175134B5B889DF5CAD74454C36B91857D7C4DFB60C1561CD6D4560F3C880EA29D162A611D95C543012DB70990D9C89606E22FBDE774988FB9CAD35C17BDE7E1224E94FFBB8EA178C60416BEA7D734EDEEF3351C602A9F19AA69A1BDE8552E88FD42C640E5F0DE2B32C7EEC1EF97FECCB68912C774C4DB0407E3AC4DA043CC96686066B29D2A19B142361A227021E5916A47378399FCE572F0EA98F423AD6573A201E747CDA7439243910FD465DFCD68C5C045077D5D8675337045F792147879A067792340E83A5896FD32DD4EC5D6B546840F238EEC753BCEEFC8196FA9240EDC922893F07AAE7C21A9DCA89989A86F1A5AB915957D231569DD9ACC0377E1E8D204DA3A8995AA491A316E3C2F4B6FEEF4CD5F34545FE849781633FAE5390F8C43743DDF7C0D8A96369A3343C776C7A8FF2E7E0C7086F0BCDFB9D28972FC4C5F40974C586E2A3CE9CA2D454C20D837BF5BB7E8CD1C43F9EF4E7DD94F7BF888D33");
		}
		
		[Test(order=19)]
		public function testBlockEncryptionWithCBCAndPKCS7():void
		{
			_aes.iv = ByteArrayUtil.fromHexString("00000000000000000000000000000000");
			_aes.key = ByteArrayUtil.fromHexString("984CA75F4EE8D706F46C2D98C0BF4A45F5B00D791C2DFEB191B5ED8E420FD627");
			_aes.mode = CipherMode.CBC;
			_aes.padding = PaddingMode.PKCS7;
			
			var cipher:ByteArray = new ByteArray();
			var data:ByteArray = ByteArrayUtil.fromHexString("19A2CC4C0D1CCAD38B59E5946B5EF8792CA525B057CEAD780BD877CD353E396101CE6ACCD442DF091ACB30EA0A5A86F97CA96BB290293624CD51F89B4A460339A04FD70CED3824663BD1F51E26A8D5C057B1B2E27A84AEFAC08FCECA0ACE1B567FC4B584063314D0446A3DEE8CF0F5619D1FFF3B30B4A0B380284A733643C4971466B3EE14A1EFD558C84463988D3BFA0BA66884158F53608ABCF5EDB0A3AFCDE0D15E36F5A965369461C3EA9D818B40E72821B25873239BA4CFFD8043EAABAB11FBBDAD3E67DD05E3459A131C6BDA12365260E09FAB233C01971DE51F371DAD156E990ABEE716C38D0E101C1A44105C01593232B66A06BCC372F2F2902FD669EAB1354E91D1B5401E6897A7F7D64DD84C86AEC75307E03EEA312B509AB0E76CF4C0D5A513FC3CB83F2A2C1CFC50FC9DE6572A4386A4695BAEA38F3D5F12CC70161B1D045E524344DED28C9603194D131DF0D6DA7734605E1E74D6960C3A123FBFC7C9B88EF8670E1B791FFAD9794248BE94071DA9C1526FF8B2049FF1F52393F7F98BD3E4EBCDAE2AB90393B61288A17746419A158E7F8B1FC17237095EF1A8706A6CF2E80CF0C5DC9CB688476D3AF2DB3A1401AB98888AF0714B4350A7EEE2BF7E6DA452D729E66B8050E8E58AE909F4A258AC6B621460391FB58423B7A2D76B7D3F9BD5A4A02D2E32CB7EF0D0CB16A6945E2D705E37BE87A9559F027F9B96CEB3680E48F9AEA84174FFD31745497CD317ED61A47A410228CEDAAC9FAF6B8BE0907444B237CB4B7BED143E0F5D24ACA7B8128852AE0427813428B8D1B0FE4FAA879DD7BA2435B647A04373FCFECD74044F9D1BA2B42BC15292EA54E0AC24D97482C8EF1A5190CDA01DEBF5582F8EB5464DFE7A5AFAFB4B87010A3A7478439F3A4EE051836C9E058163515A622D23D2E816B0E7A23913CED499EC66E316C2D260EBA30D593F522959303ED28EF7DE07270F6E6AAB23C804AEDD0EBB90FD2E361B1ABDCC05DE14839E45827CC4E409D6A02A65F6695863A4F699631B260A50465E02582306726142B611849A90746417EB141A2A1A5B25A4EC58B4052B1362D914D736CF53C11F6A579C08F3D50FF9C7E44012D10D559A45382EEA529AA6F849ACF9D8D4C26E552E38266DE8FB463926FE3402757A2A481CE5FE514FA63339FEE1892E55EB4A4DB7701CA00601E9813C47FA662522D7D976D4FDDADB44B597A9CD1A4C9ABCD92E4BC22D595885656D635190783534C751AEE1E535F3D171067CFA905C7373C1E9859E9AF4A3930566670459320269956D9F30442832D8B3C404F7B6A8D1D5240F047DF41941D2014C5E3A96863507ED7AE73EC73196B0A27C564E09A3B168FAA66BBC80D434D56BF6604FD3920D64A6511DC74A8CBE8CAE9EA5417BC3118FC86F1A4C8E32E2FCE0126230A07E6A87BC83D4E1CAEA3A4CDCAA12489475A1501756BF631B78BC1F08682F30ECFD0EACDF69BBE7BE0EBF884672336F2491DEF5160A6424A21C46588F0BA7B2CC580519F07D56C0564E36D156E870C61F7A4633B18AECE5025A97CA72D11F727DC260AC4ED5354A7D7995EB31C2D2AE09F69A2470695E798A297827E5798ADD10187BB728EC2F7FFFD5497735D8F58F8807597EAE785A44BD4DFCB30FFF9C5D8EA627C7B0BE59B7C93E1EB50CB9E3AE665BCE47147703167D3B99B959A51001D66860697B0312FD42AA88396998C84A64307650D4C808B9D3D5C42042A0E5E485F8F05F737CA382F6BD1D9A189776FB504477AD91C1AD64309785BBBA1AED7A1294A83CB491DD4FE4120D630685F2165B8E6DAF7C082D86D976035D202F1544A772E6CB1482BBB8AFCFF4F6913D0B2EFE27D4D212FB2084A88B4C4DED9240FA0CF6BA6089BD1E57AF7FE956A36A4F90D74E379A6B3C740808651B6603A125C013EEE6C7D67FBDF60C667044FFB5BFD10FB2956803F1FCF24251A7FEA4BD01584B459F5934AC55B478453DA86F4F3D03E850F10E44E9CECD79593A48BF0E4CE6343623F583283E814A669F072224B7292997F1B0AB13B9CE568B81B1F5E48888961C018E7E98B78CD76F7A8FC149F2D240B1FA669BE276F9794FFA6B9BBDAB9F34C22F6AA2CC47A128FD18BA9715EB8532DF26D0A72224E96EFBDD49E68631CCAE5FC581B0EAA98C2D9AFF0C9120E5DB60D4EFE7E2AA0C967FC8790B71869AD0FC5E3F4304270B33C30D0D8879B968A615C0FB4906283E41817292DA329B73518AC52E35E239FB5A314A275CB2263D3215767EE5CB46EED75A016B0AA90576AF1206FA1EDCA5176F2F27FE75774BD5EEBD3E8E50EE872C1CE76F8738470FBC175134B5B889DF5CAD74454C36B91857D7C4DFB60C1561CD6D4560F3C880EA29D162A611D95C543012DB70990D9C89606E22FBDE774988FB9CAD35C17BDE7E1224E94FFBB8EA178C60416BEA7D734EDEEF3351C602A9F19AA69A1BDE8552E88FD42C640E5F0DE2B32C7EEC1EF97FECCB68912C774C4DB0407E3AC4DA043CC96686066B29D2A19B142361A227021E5916A47378399FCE572F0EA98F423AD6573A201E747CDA7439243910FD465DFCD68C5C045077D5D8675337045F792147879A067792340E83A5896FD32DD4EC5D6B546840F238EEC753BCEEFC8196FA9240EDC922893F07AAE7C21A9DCA89989A86F1A5AB915957D231569DD9ACC0377E1E8D204DA3A8995AA491A316E3C2F4B6FEEF4CD5F34545FE849781633FAE5390F8C43743DDF7C0D8A96369A3343C776C7A8FF2E7E0C7086F0BCDFB9D28972FC4C5F40974C586E2A3CE9CA2D454C20D837BF5BB7E8CD1C43F9EF4E7DD94F7BF888D33");
			var encryptor:ICryptoTransform = _aes.createEncryptor();
			var inputBlockSize:int = encryptor.inputBlockSize;
			var inputOffset:int;
			var outputOffset:int;
			
			for (inputOffset = 0, outputOffset = 0; data.length - outputOffset > inputBlockSize; inputOffset += inputBlockSize)
				outputOffset += encryptor.transformBlock(data, inputOffset, inputBlockSize, cipher, outputOffset);
			
			cipher.writeBytes(encryptor.transformFinalBlock(data, outputOffset, data.length - outputOffset));
			
			assertCipherIsValid(ByteArrayUtil.toHexString(cipher), "1ADF171F7316370DE4FDB0422B665895255FA79B4ED71D12FF2D581EF3A10454A34A2D7D113807B702183B72BFA680CE426CBBD9FE54B6FCCAB4FE7A8FCE8089C0E1545AB66CE721BC4DEDBD6830413FD6DDE830AAD73C46717C6F873F4EF43115469DB05F22A1E05CEEA82B6BE0C9C183C01D43B046E611162847D85223C7BDF521D7D39D5ADC30A7B17800F8499D89BD4F5C8E074299FA587AE61CA2374F592A8D4A93141754B32B6CCF40DF399A32AD4068C5842858C925D50D0BD0E864D0B03EEBF5018999F5F219713CE758B3B5CBC34122B93BF2FD77DD7890E5ABC6E736590657AC2D37DA8B84C4AD761A57E5F1E43F582279564436303BE6F6AFF4C6857A1C4EDC6E520DFE7BFB97CE7BC76D3F7C7997870926B8281BE43A0A05297E1504B7209D3DE397F5AA035C93B896A7DA869C785EEEF540B7731D044C816F9D2DA590D2C155A14C746CABFC30FB037BD31E87634AC9A61F2A26B2FA6208CA87425DD86502D1158BF6B00AF9450C46BCECCE9F3801AB9E1544C8440C8F73C73BC8CA2FE1F9DAE69F04EAAB77C12675396D5CA5ED3C3C2CEE6311B441F954DF0C02C18C7B83D19BA2AEEA757221BA90AB055525AE4B16DD69454B2045973A5FBAA91A1E1205E42B2225AD57A90944FBEAE1FD6B9D15993118DB22DEC4D8B265D904FF88C6B9F1910327C4DC11DAC96E7B9F0D8BDA635D9D1515693D71D037326D44CD5726EB33D1DF82A488F22A9CD6021CF3F703F2D269835987D6161BAA4F33C0EBB85DF0BECE89C074AFB6E3B6CDB2C19F0DA4E075FF18F12BEB62D837F804F6C5AA306CF3C6358ADEA047190070D2F09EEB283D9643132D1E9C349AE7C9034F7F02A5574D07230FDCA805C6BD45C9D8B675FB5A3D8F94DDDCEA506684DFC21DC10AA3872E08CD58351B16A71D91450E4A3E8442AED5FCB8C3DEC3939A4A0E73C621393C9CA5F36F0D7B4DEB16D332D905E7D66E16727989B51DCAAED3D53FCBAB70C1BF318E2D9880443721B3ABA77E307F9C659B47FFC02421171254868FFD9F75F2675C9387749E128F528E6A805834F317765E47E647947D99ADBC17CFBA7D6AC414B4E5BC92CC7E854F5AE7CAA1FF7330CB6A1581632AB5A06C4FDBAD9B237766C6D90B95F9B51316CFAE1C6F2AC7108BC05DD82716274E2113ECDACD8348E1E21B59A78890DC4EB9BE20A8F13B221E35C56D6EF4CF789597DC3CD6992C03685E64EB1B436F2F949C5BE46A6F9C012AE7E0E1BE26947C9A8DA948669C3B57B2515FE008AE9CDA2916716EA6201A6D37998A71098A381E81D1617EDE57E73FCC4CF4CAF5CCF37FF8E8767745C4A26AAB66A2EFC37283562C4D6784D5968DF3CDA67D7E69A3146021C1806DC3EB5891E5892B44B58763961C2F905EE33212D1DDD11C7990640F9DDCD9B0B736E226A92E60CEA46E5268B4D8F05402DA2B46DD747E0674D9B131D52EC2F67FB917DA3851AAAFC116673A2271122822D4AB8CD43D0D7333D0D089A7D4B591682C8E880B2DF04B7693BB0604761AA956120435FD1927424CF4371E30099D7A4889A49CAD59D0D29113803D040C4F3983A6BC3D8FDE2F4BA28B27D8D91869061F8306D4C2713A1CE1283AB6AAEC6DECC956105D2F6FEE1615B4D14782B5FE2AF8B7EA404988F1EB3318A7193B1C2C4E4859D5806D430B526931B4494EF547F513BBFB077F8483069F3BB8E2589AAAD945F79513A9920C3E7F1CFF3194A18755D692E605526F4058B26966AFAF3243D4EF0DABDB7B3852B1DA32AB143044245E97BF74962124C80898F2E566441F5CEB6F5724E6181B801623AFB69161407C6D98C6618A398A97FD7BBA22E3DAB38AA9374A295085177009CEB07413AB8B5889E72A6234AC989863E29D7760FBEA708A5C8E22E8C22FA421D8E5172D55D62AFFEC46108090577477ABDADF462661E51EA634740E16F0F62D591ADBAC688101245E23F0782F6613DC26EC668D26E7B1699DE856160BDF8EABE092A1123D749902F70DAA8EA17769BB3BFAE77C1F3254ED940F7C2ED24E7367AA405F2444D3D56ECC18E197556F00070F72837C687514CA6940A256514B854B09F29ABC50C76C82FEDD62FB8F6C73943ED75505625E3CA8A995945B6AFB5ADAE6CA9D425F35A3A037F99DDBE2EA59372257FAD190FC8D5AADCCE230D51E6F6E4991B3E93ACCDF14630743762DC9BF93253FE1FA62F7AF98CD3738727DDD05E452207F6C96C922B7FD1FEA39F6747934250BBDD23D8B82E722D825778418805BAC5C59303ACE7996C9B7C767F9A34A3D36CB6CE81E2A150DABC3684EC262D89DF30505502E87D118EA431A7DA998E1B26EFFCFC36BA6FC129868E9A4335E6D6A88249213C13464FFE2B3ACBD478D2D09E31EAA4D126B0DA2BFC84BCFF75F4BCF862877BAFBECEE61DFD1DBEE09250B45B9B1A4C63A87ABBB3E20A3579A72535B298285DFAF7D6C9BC322A5C264860F3F283B8D1F490F24A443D02B23280D03D790F4E6C750757D67D4FA204323311E3874674EDD5A65AA958A93E5B9C5C73E63FB15835E7C7D19F9CE2A58769C4081DDAC6CFD9EC8234622A8870F2E7087BE1585F9D64A0173843F2AF876A5F37309FEBBDB6EBAA67D051B4D090DE63BFDDAC6245122228CA473F7BACBE0BBCB5EC45112D0692D3C9C74EA9A11B21CD7224E4C6A2223FEA1E7184A0BD0D16CE4CEC0B744D3F2523D61B4517B2E8A9447FC2B08AA6AD924DB2404A27D34FEE1AC564C83659211159DE4BE1914D845D5C796A812052244337BC705795A54A60DDE5980B7933951E06FCEEE0A3D06BAADBA086B248A5FAE876BE1869A33EDA9854AFA7EF06F5AA775929A37287B3549");
		}
		
		[Test(order=2)]
		public function testDecryptionWithCBC():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("46F2FB342D6F0AB477476FC501242C5F"),
				ByteArrayUtil.fromHexString("C47B0294DBBBEE0FEC4757F22FFEEE3587CA4730C3D33B691DF38BAB076BC558"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.NONE, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=4)]
		public function testDecryptionWithCBCAndANSIX923():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("4BF3B0A69AEB6657794F2901B1440AD457861C1A3B6DBC6B1239C577EDB8CA3D"),
				ByteArrayUtil.fromHexString("28D46CFFA158533194214A91E712FC2B45B518076675AFFD910EDECA5F41AC64"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.ANSIX923, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=6)]
		public function testDecryptionWithCBCAndPKCS7():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("352065272169ABF9856843927D0674FD97A1494D36EC32FF0B46E4F5E202713F"),
				ByteArrayUtil.fromHexString("C1CC358B449909A19436CFBB3F852EF8BCB5ED12AC7058325F56E6099AAB1A1C"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.PKCS7, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=8)]
		public function testDecryptionWithCFB():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("6D251E6944B051E04EAA6FB4DBF78465"),
				ByteArrayUtil.fromHexString("10A58869D74BE5A374CF867CFB473859"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.NONE, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=10)]
		public function testDecryptionWithCFBAndANSIX923():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("6E29201190152DF4EE058139DEF610BBF05E492633E06C962AA9EC33FA8043B0"),
				ByteArrayUtil.fromHexString("CAEA65CDBB75E9169ECD22EBE6E54675"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.ANSIX923, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=12)]
		public function testDecryptionWithCFBAndPKCS7():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("C3B44B95D9D2F25670EEE9A0DE099FA3033BC39EA7707D8AE72050C21758D44E"),
				ByteArrayUtil.fromHexString("A2E2FA9BAF7D20822CA9F0542F764A41"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.PKCS7, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=14)]
		public function testDecryptionWithECB():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("0956259C9CD5CFD0181CCA53380CDE06"),
				ByteArrayUtil.fromHexString("E9F065D7C13573587F7875357DFBB16C53489F6A4BD0F7CD"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.NONE, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=16)]
		public function testDecryptionWithECBAndANSIX923():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("8E4E18424E591A3D5B6F0876F16F8594351A0B8E473B2844AC8A4071C772501D"),
				ByteArrayUtil.fromHexString("15D20F6EBC7E649FD95B76B107E6DABA967C8A9484797F29"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.ANSIX923, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=18)]
		public function testDecryptionWithECBAndPKCS7():void
		{
			testDecryption(
				ByteArrayUtil.fromHexString("93F3270CFC877EF17E106CE938979CB0339155AEAF408CF361150C80FF17F055"),
				ByteArrayUtil.fromHexString("A8A282EE31C03FAE4F8E9B8930D5473C2ED695A347E88B7C"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.PKCS7, "00000000000000000000000000000000"
			);
		}
		
		[Test(order=1)]
		public function testEncryptionWithCBC():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("C47B0294DBBBEE0FEC4757F22FFEEE3587CA4730C3D33B691DF38BAB076BC558"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.NONE, "46F2FB342D6F0AB477476FC501242C5F"
			);
		}
		
		[Test(order=3)]
		public function testEncryptionWithCBCAndANSIX923():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("28D46CFFA158533194214A91E712FC2B45B518076675AFFD910EDECA5F41AC64"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.ANSIX923, "4BF3B0A69AEB6657794F2901B1440AD457861C1A3B6DBC6B1239C577EDB8CA3D"
			);
		}
		
		[Test(order=5)]
		public function testEncryptionWithCBCAndPKCS7():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("C1CC358B449909A19436CFBB3F852EF8BCB5ED12AC7058325F56E6099AAB1A1C"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CBC, PaddingMode.PKCS7, "352065272169ABF9856843927D0674FD97A1494D36EC32FF0B46E4F5E202713F"
			);
		}
		
		[Test(order=7)]
		public function testEncryptionWithCFB():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("10A58869D74BE5A374CF867CFB473859"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.NONE, "6D251E6944B051E04EAA6FB4DBF78465"
			);
		}
		
		[Test(order=9)]
		public function testEncryptionWithCFBAndANSIX923():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("CAEA65CDBB75E9169ECD22EBE6E54675"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.ANSIX923, "6E29201190152DF4EE058139DEF610BBF05E492633E06C962AA9EC33FA8043B0"
			);
		}
		
		[Test(order=11)]
		public function testEncryptionWithCFBAndPKCS7():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("A2E2FA9BAF7D20822CA9F0542F764A41"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.CFB, PaddingMode.PKCS7, "C3B44B95D9D2F25670EEE9A0DE099FA3033BC39EA7707D8AE72050C21758D44E"
			);
		}
		
		[Test(order=13)]
		public function testEncryptionWithECB():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("E9F065D7C13573587F7875357DFBB16C53489F6A4BD0F7CD"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.NONE, "0956259C9CD5CFD0181CCA53380CDE06"
			);
		}
		
		[Test(order=15)]
		public function testEncryptionWithECBAndANSIX923():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("15D20F6EBC7E649FD95B76B107E6DABA967C8A9484797F29"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.ANSIX923, "8E4E18424E591A3D5B6F0876F16F8594351A0B8E473B2844AC8A4071C772501D"
			);
		}
		
		[Test(order=17)]
		public function testEncryptionWithECBAndPKCS7():void
		{
			testEncryption(
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				ByteArrayUtil.fromHexString("A8A282EE31C03FAE4F8E9B8930D5473C2ED695A347E88B7C"),
				ByteArrayUtil.fromHexString("00000000000000000000000000000000"),
				CipherMode.ECB, PaddingMode.PKCS7, "93F3270CFC877EF17E106CE938979CB0339155AEAF408CF361150C80FF17F055"
			);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		private function assertCipherIsValid(cipher:String, expectedCipher:String):void
		{
			Assert.assertTrue(StringUtil.substitute("Invalid cipher. Expected '{0}', got '{1}'.", expectedCipher, cipher), cipher == expectedCipher);
		}
		
		private function assertDataIsValid(data:String, expectedData:String):void
		{
			Assert.assertTrue(StringUtil.substitute("Invalid value. Expected '{0}', got '{1}'.", expectedData, data), data == expectedData);
		}
		
		private function testDecryption(cipher:ByteArray, key:ByteArray, iv:ByteArray, mode:uint, padding:uint, expectedValue:String):void
		{
			_aes.iv = iv;
			_aes.key = key;
			_aes.mode = mode;
			_aes.padding = padding;
			
			assertDataIsValid(ByteArrayUtil.toHexString(_aes.createDecryptor().transformFinalBlock(cipher, 0, cipher.length)), expectedValue);
		}
		
		private function testEncryption(data:ByteArray, key:ByteArray, iv:ByteArray, mode:uint, padding:uint, expectedCipher:String):void
		{
			_aes.iv = iv;
			_aes.key = key;
			_aes.mode = mode;
			_aes.padding = padding;
			
			assertCipherIsValid(ByteArrayUtil.toHexString(_aes.createEncryptor().transformFinalBlock(data, 0, data.length)), expectedCipher);
		}
	}
}