<?php

namespace Tests\AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class UserControllerTest extends WebTestCase
{
    public function testUserGet()
    {
        $client = static::createClient();

        $crawler = $client->request('GET', '/user');
        $response = $client->getResponse();

        $this->assertEquals(200, $client->getResponse()->getStatusCode());
        $this->assertEquals('[{"id":1,"name":"Tim","role":"PA"}]', $response->getContent());
    }
}
