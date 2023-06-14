import UIKit

/*
 
  🌴 What is Tree?
 - Tree consists of Nodes & Branches that doesn't cycle.
 
 
   "Linked List used Nodes."
 
   Node = Data + Addresses to next Data
 
   연결리스트는 head 와 tail 같은 "선형 구조"로 이루어져 있다.
   그에 반해,
   트리는 최상위 노드가 존재하며, 그 노드를 기준으로 왼쪽과 오른쪽에 "자식" 으로 배치가 되는 "비선형 구조"를 가지고 있다.
   하위로 떨어지는 그 선이 "branch" 이다. 즉, 다음 주소값은 내 자식 노드들의 주소값을 가리는구나 라고 이해하자.
   
   아래로만 떨어지므로, 순환될 일이 없다. 사이클이 존재하지 않는다.
 
 
   Node: 트리에서 데이터를 구성하고 있는 각 요소 (데이터 및 Branch 정보도 포함)
   Root Node: 트리의 최상위에 있는 노드
   Level: 노드의 깊이
   Parent Node: 어떤 노드의 다음 레벨에 연결된 노드
   Child Node: 어떤 노드의 이전 레벨에 연결된 노드
   Leaf Node(Terminal Node): Child Node 가 하나도 없는 노드
   Depth: 트리에서 Node 가 가질 수 있는 가장 깊은 Level
 
*/
 
/**
 
 🌴² What is Binary Tree?
 - Binary Tree consists of Nodes that have maximum of TWO branches. AND, there's a rule for the mechanism.
 
 1️⃣ 모든 노드가 자신의 "왼쪽" Child Node 에는 자신의 값보다 "작은" 값이, "오른쪽" Child Node 에는 자신의 값보다 "큰" 값이 오는 규칙을 만족해야 한다.
 
 2️⃣ 노드의 데이터 값은 중복되지 않고 유일하다. 노드의 데이터 값은 항상 존재한다. (nil 이 아니다.)
 
 3️⃣ BST 는 배열로 구현하지 않는다. 연결리스트로 구현한다.
 
 */

class BSTNode {
    
    
}

