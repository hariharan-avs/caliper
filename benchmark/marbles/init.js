/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';

module.exports.info  = 'Creating marbles.';

let txIndex = 0;
let colors = ['red', 'blue', 'green', 'black', 'white', 'pink', 'rainbow'];
let owners = ['Alice', 'Bob', 'Claire', 'David', 'Eugene','Franklin',
              'George', 'Haris','Indro','Jacob','Kalis','Leius','Manro','Necolus','Oustin','Polard',
              'Qualis','Rover','Sampraus','Trump','Umbro','Vettori','Willium','Xavier','Zeck'];
let bc, contx;
module.exports.init = function(blockchain, context, args) {
    bc = blockchain;
    contx = context;
    return Promise.resolve();
};

module.exports.run = function() {
    txIndex++;
    return bc.invokeSmartContract(contx, 'marbles', 'v1',
        {
            verb: 'initMarble',
            name: 'marble_' + txIndex.toString() + '_' + process.pid.toString(),
            color: colors[txIndex % colors.length],
            size: (((txIndex % 10) + 1) * 10).toString(), // [10, 100]
            owner: owners[txIndex % owners.length]
        }, 30);
};

module.exports.end = function() {
    return Promise.resolve();
};
