Vim�UnDo� ���<�\c%��[M֐-to������   P   *        self.browser = webdriver.Firefox()   7   !                       V��R    _�                             ����                                                                                                                                                                                                                                                                                                                                                             V}i{    �          �       �          �    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             V}i�     �                import time5�_�                            ����                                                                                                                                                                                                                                                                                                                                       *           V        V}i�    �   
              /class FunctionalTest(StaticLiveServerTestCase):           @classmethod       def setUpClass(cls):           for argv in sys.argv:   $            if 'liveserver' in argv:   ?                cls.server_url = 'http://' + argv.split('=')[1]                   return           super().setUpClass()   ,        cls.server_url = cls.live_server_url           @classmethod       def tearDownClass(cls):           try:   5            if cls.server_url == cls.live_server_url:   '                super().tearDownClass()           except:               pass           def setUp(self):   *        self.browser = webdriver.Firefox()   )        # self.browser.implicitly_wait(3)           def tearDown(self):           self.browser.quit()       4    def check_for_row_in_list_table(self, row_text):   @        table = self.browser.find_element_by_id('id_list_table')   4        rows = table.find_elements_by_tag_name('tr')   ;        self.assertIn(row_text, [row.text for row in rows])        5�_�                    U        ����                                                                                                                                                                                                                                                                                                                                                  V        V}i�    �   T   U       2           'class LayoutAndStyling(FunctionalTest):       &    def test_layout_and_styling(self):   %        # Edith goes to the home page   )        self.browser.get(self.server_url)   /        self.browser.set_window_size(1024, 768)       7        # She noticed that input box is nicely centered   A        inputbox = self.browser.find_element_by_id("id_new_item")           self.assertAlmostEqual(   >            inputbox.location['x'] + inputbox.size['width']/2,               512,               delta=5   	        )       C        # She starts a new list and sees the input is centered here           # nicely too   '        inputbox.send_keys('testing\n')   A        inputbox = self.browser.find_element_by_id("id_new_item")           self.assertAlmostEqual(   >            inputbox.location['x'] + inputbox.size['width']/2,               512,               delta=5   	        )           )class ItemValidationTest(FunctionalTest):       	    @skip   .    def test_cannot_add_empty_list_item(self):   F        # Edith goes to the home page and accidentally tries to submit   C        # an empty list item. She hits Enter on the empty input box       G        # The home page refreshes, and there is an error message saying   )        # that list items cannot be blank       F        # She tries again with some text for the item, which now works       H        # Perversely, she now decides to submit a second blank list item       9        # She receives a similar warning on the list page       8        # And she can correct it by filling some text in           self.fail("Write me!")           if __name__ == '__main__':       unittest.main()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V}i�     �                
import sys   import unittest   Gfrom django.contrib.staticfiles.testing import StaticLiveServerTestCase    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V}i�    �         P    �         P    5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  V        V}i�    �                from unittest import skip5�_�      	                      ����                                                                                                                                                                                                                                                                                                                                                             V���    �   A   C          A        inputbox = self.browser.find_element_by_id('id_new_item')�   *   ,          A        inputbox = self.browser.find_element_by_id('id_new_item')�                A        inputbox = self.browser.find_element_by_id('id_new_item')5�_�      
           	   7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��K     �   6   8   P      *        self.browser = webdriver.Firefox()5�_�   	              
   7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��K     �   6   8   P      )        self.browser = webdriver.irefox()5�_�   
                 7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��L     �   6   8   P      (        self.browser = webdriver.refox()5�_�                    7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��L     �   6   8   P      '        self.browser = webdriver.efox()5�_�                    7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��L     �   6   8   P      &        self.browser = webdriver.fox()5�_�                    7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��L     �   6   8   P      %        self.browser = webdriver.ox()5�_�                    7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��N     �   6   8   P      $        self.browser = webdriver.x()5�_�                    7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��P     �   6   8   P      $        self.browser = webdriver.x()5�_�                     7   !    ����                                                                                                                                                                                                                                                                                                                                                             V��Q    �   6   8   P      #        self.browser = webdriver.()5��