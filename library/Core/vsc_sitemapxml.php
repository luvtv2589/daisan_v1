<?php

class vsc_sitemapxml extends Admin{
    public static $document = null;
    private static $options = array();
    
    public function __construct( $option = array() ){
        if( isset( $option ) ) {
            self::$options = $option;
            
            if (!self::$document) {
                self::$document = new DOMDocument(self::$options['version'], self::$options['charset']);
                self::$document->formatOutput = true;
                self::$document->preserveWhiteSpace = false;
                
                /* generate the urlset once */
                $this->addurlset();
            }
        } else {
            return 'Could not find option';
        }
    }
    
    /* generate the root node - urlset */
    private function addurlset(){
        $urlset=$this->createElement( 'urlset' );
        $urlset->setAttribute('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9');
        $this->appendChild( $urlset );
    }
    
    /* add item to xml */
    public function generateXML( $result=array() ){
        if( !empty( $result ) && is_array( $result ) ){
            
            $urlset=self::$document->getElementsByTagName('urlset')[0];
            
            foreach ($result as $var) {
                $var['lastmod'] = $this->trimLastmod($var['lastmod']);
                $item = $this->createElement('url');
                $urlset->appendChild($item);
                $this->createItem($item, $var);
            }
        }
    }
    
    public function finishGenerateXML()
    {
        $this->saveFile(self::$options['xml_filename']);
        $this->saveXML();
    }
    private function trimLastmod($value)
    {
        return date('c', strtotime($value));
    }
    //Create element
    private function createElement($element)
    {
        return self::$document->createElement($element);
    }
    //Append child node
    private function appendChild($child)
    {
        return self::$document->appendChild($child);
    }
    //Add item
    private function createItem($item, $data, $attribute = array())
    {
        if (is_array($data)) {
            foreach ($data as $key => $val) {
                //Create an element, the element name cannot begin with a number
                is_numeric($key{0}) && exit($key.' Error: First char cannot be a number');
                $temp = self::$document->createElement($key);
                $item->appendChild($temp);
                //Add element value
                $text = self::$document->createTextNode($val);
                $temp->appendChild($text);
                if (isset($attribute[$key])) {
                    foreach ($attribute[$key] as $akey => $row) {
                        //Create attribute node
                        $temps = self::$document->createAttribute($akey);
                        $temp->appendChild($temps);
                        //Create attribute value node
                        $aval = self::$document->createTextNode($row);
                        $temps->appendChild($aval);
                    }
                }
            }
        }
    }
    //Return xml string
    private function saveXML()
    {
        return self::$document->saveXML();
    }
    //Save xml file to path
    private function saveFile($fpath)
    {
        //Write file
        $writeXML = file_put_contents($fpath, self::$document->saveXML());
        if ($writeXML === true) {
            return self::$document->saveXML();
        } else {
            return 'Could not write into file';
        }
    }
    
    //Load xml file
    public function loadSitemap($fpath)
    {
        if (!file_exists($fpath)) {
            exit($fpath.' is a invalid file');
        }
        //Returns TRUE on success, or FALSE on failure
        self::$document->load($fpath);
        return print self::$document->saveXML();
    }
}//end class





// $category[] = array(
//     'loc' => 'http://example.com/?=10',
//     'lastmod' => '2019-05-12 10:47:05',
//     'changefreq' => 'always',
//     'priority' => '1.0'
// );
// $board[] = array(
//     'loc' => 'http://example.com/?=3',
//     'lastmod' => '2019-05-12 10:47:05',
//     'changefreq' => 'always',
//     'priority' => '1.0'
// );
// $article[] = array(
//     'loc' => 'http://example.com/?=404',
//     'lastmod' => '2019-05-13 10:47:05',
//     'changefreq' => 'weekly',
//     'priority' => '0.5'
// );


// $seoOption = array(
//     'version'       => '1.0',
//     'charset'       => 'UTF-8',
//     'xml_filename'  => 'seo.xml'
// );
//$seo = new vsc_sitemap($seoOption);
// $seo->generateXML($category);
// $seo->generateXML($board);
// $seo->generateXML($article);
// $seo->finishGenerateXML();
?>