<?php

namespace Differ\Formatters\Json;

function format($data)
{
    return json_encode($data, JSON_THROW_ON_ERROR);
}