<?php

declare(strict_types= 1);

namespace App\Controllers;

use Slim\Psr7\Response;
use Slim\Psr7\Request;
use App\Dao\FileDao;
use Slim\Exception\HttpNotFoundException;
class FilesController{
 
  public function __construct(private FileDao $dao){}

  public function getAll(Request $request, Response $response): Response {
    $data = $this->dao->getAll();
    $body = json_encode($data);
    $response->getBody()->write($body);

    return $response;
  }

  public function getById(Request $request, Response $response, string $id): Response {
    $data = $this->dao->getById($id);
    
    if($data === false){
      throw new HttpNotFoundException($request, message: 'File not found');
    }

    $body = json_encode($data);
    $response->getBody()->write($body);

    return $response;
  }

  public function create(Request $request, Response $response): Response {
    $body = $request->getParsedBody();

    $body = json_encode($body);

    $response->getBody()->write($body);

    return $response;
  }
}