from selenium import webdriver
import time

chrome_options = webdriver.ChromeOptions()
chrome_options.add_experimental_option('prefs',  {
    "download.prompt_for_download": False,
    "download.directory_upgrade": True,
    "plugins.always_open_pdf_externally": True
})

driver = webdriver.Chrome(options=chrome_options)
driver.get(
    'http://www.ans.gov.br/prestadores/tiss-troca-de-informacao-de-saude-suplementar')
time.sleep(2.5)
driver.find_element_by_xpath(
    '/html/body/div[9]/div/div[2]/div[2]/div[2]/a').click()
driver.find_element_by_xpath(
    '/html/body/div[9]/div/div[2]/div[2]/div[2]/table/tbody/tr[1]/td[3]/a').click()
